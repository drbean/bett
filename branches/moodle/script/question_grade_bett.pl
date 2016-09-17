#!perl

use strict;
use warnings;
use lib 'lib';
use FindBin '$Bin';
use Pod::Usage;

use Config::General;
use YAML qw/Bless Dump LoadFile/;
use List::Util qw/reduce/;
use Moose::Autobox;
use Bett::Model::DB;
use Bett::Schema;

use Grades;

package Script;

use Moose;
with 'MooseX::Getopt';

has 'man'  => ( is => 'ro', isa => 'Bool' );
has 'help' => ( is => 'ro', isa => 'Bool' );
has 'league' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 'l',);
has 'exercise' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 'x',);
has 'quitter' => (
    traits => ['Getopt'], is => 'ro', isa => 'Int', required => 0,
    cmd_aliases => 'q',);
has 'loser' => (
    traits => ['Getopt'], is => 'ro', isa => 'Int', required => 0,
    cmd_aliases => 'o',);
has 'winner' => (
    traits => ['Getopt'], is => 'ro', isa => 'Int', required => 0,
    cmd_aliases => 'w',);

package main;

my $config = LoadFile "bett.yaml";
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $id = $script->league;
my $exercise = $script->exercise;
my $quitter = $script->quitter;
my $loser = $script->loser;
my $winner = $script->winner;
my @courses = qw/Wh Yn Tag/;
my $results = { quitter => $quitter, loser => $loser, winner => $winner };
my $man = $script->man;
my $help = $script->help;

pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

# ( my $leagueid = $id ) =~ s/^([[:alpha:]]+[[:digit:]]+).*$/$1/;
my $leagueid = $id;
my $league = League->new( id => $leagueid );
my $members = $league->members;
my %members = map { $_->{id} => $_ } @$members;
my ($report, $card);
$report->{exercise} = $exercise;
$report->{cutpoints} =
	{ quitter => $quitter, loser => $loser, winner => $winner };
for my $course ( @courses ) {
	my $class = $schema->resultset($course)->search({
			league => $id, exercise => $exercise });
	my $Course = $course eq 'Tag'? $course: uc $course;
	my $course_config = $config->{$Course};
	for my $player ( keys %members ) {
		my $standing = $class->find({ player => $player });
		my ( $score, $questions ) = ( 0 ) x 2;
		if ( $standing ) {
			$score = $standing->score;
			$report->{points}->{$player}->{$course}->{answers} = $score;
			$report->{points}->{$player}->{$course}->{questions} = $questions;
			$report->{points}->{$player}->{$course}->{attempts} =
				$standing->try;
			my $grade = $score >= $course_config->{win} ?
				'winner': $standing->try >=
									$course_config->{chances}->{question} ?
				'loser': ( $standing->try > 0 )?
				'quitter':
				'non-starter';
			push @{ $card->{$player} }, $grade;
		}
		else {
			$report->{points}->{$player}->{$course}->{questions} = undef;
			$report->{points}->{$player}->{$course}->{answers} = undef;
			$report->{points}->{$player}->{$course}->{attempts} = undef;
			push @{ $card->{$player} }, "no-show";
		}
		Bless( $report->{points}->{$player}->{$course} )->keys(
			[ qw/answers questions attempts/ ] );
		Bless( $report->{points}->{$player} )->keys(  \@courses  );
	}
}

sub takeWin {
	return $a if $a eq 'winner';
	return $b if $b eq 'winner';
	return $a if $a eq 'loser';
	return $b if $b eq 'loser';
	return $a if $a eq 'quitter';
	return $b if $b eq 'quitter';
	return $a if $a eq 'non-starter';
	return $b if $b eq 'non-starter';
	return $a if $a;
	return $b if $b;
}


for my $member (keys %members) {
	my $my_card = $card->{$member};
	my $grade = reduce {takeWin} "no-show", @$my_card;
	if ( $grade eq 'no-show' or $grade eq 'non-starter' ) {
		$report->{grade}->{$member} = 0;
	}
	else {
		$report->{grade}->{$member} = $results->{$grade};
	}
}

print Dump $report;

=head1 NAME

question_grade_bett.pl - record question results from bett DB

=head1 SYNOPSIS

perl script/question_grade_bett.pl -l FIA0034 -x adventure -q 4 -o 1 -w 2 > /home/drbean/002/FIA0034/homework/2.yaml

=head1 DESCRIPTION

SELECT * FROM {wh,yn,s} WHERE league='FIA0034';

Grading on questions, and not answers, requires that Bett on the web set score in the wh, yn and tag tables on the basis of questions not answers, something which may be buggy.

People who quit before GAME OVER get q points. Players who get to GAME OVER, but who fail to be winners, ie are losers, get l points, and winners get w points.

Output numbers of grammatically-correct questions, and questions attempted (some/a number of which may be empty) in the wh, yn and tag courses.

NO LONGER TRUE: If attempt quota for YN course is filled (over all courses), but there are not enough questions to qualify as a winner or loser in any one course, player is treated as a Loser.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
