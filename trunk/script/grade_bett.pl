#!perl

use strict;
use warnings;
use lib 'lib';
use FindBin '$Bin';
use Pod::Usage;

use Config::General;
use YAML qw/Bless Dump/;
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

my %config = Config::General->new( "bett.conf" )->getall;
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $id = $script->league;
my $exercise = $script->exercise;
my $quitter = $script->quitter;
my $loser = $script->loser;
my $winner = $script->winner;
my $results = { quitter => $quitter, loser => $loser, winner => $winner };
my $man = $script->man;
my $help = $script->help;

pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

my $league = League->new( id => $id );
my $members = $league->members;
my %members = map { $_->{id} => $_ } @$members;
my ($report, $card);
$report->{exercise} = $exercise;
$report->{cutpoints} =
	{ quitter => $quitter, loser => $loser, winner => $winner };
for my $course ( qw/Wh Yn S/ ) {
	my $class = $schema->resultset($course)->search({
			league => $id, exercise => $exercise });
	my $config = $config{uc $course};
	my $answerchances = $config->{chances}->{answer};
	for my $player ( keys %members ) {
		my $standing = $class->find({ player => $player });
		my ( $score, $answerchancesleft, $questions );
		if ( $standing ) {
			$score = $standing->score;
			$answerchancesleft = $standing->answerchance;
			$questions = $score + $answerchances - $answerchancesleft;
			$report->{points}->{$player}->{$course}->{answers} = $score;
			$report->{points}->{$player}->{$course}->{questions} = $questions;
			$report->{points}->{$player}->{$course}->{attempts} =
				$standing->try;
			my $grade = ($score >= $config->{win}) ?
				'winner': (($questions >= $config->{win}) or
								($answerchancesleft <= 0) or
									($standing->questionchance <= 0)) ?
				'loser': 'quitter';
			push @{ $card->{$player} }, $grade;
		}
		else {
			$report->{points}->{$player}->{$course}->{questions} = undef;
			$report->{points}->{$player}->{$course}->{answers} = undef;
			$report->{points}->{$player}->{$course}->{attempts} = undef;
			push @{ $card->{$player} }, "quitter";
		}
		Bless( $report->{points}->{$player}->{$course} )->keys(
			[ qw/answers questions attempts/ ] );
		Bless( $report->{points}->{$player} )->keys( [ qw/Wh Yn S/ ] );
	}
}

sub takeWin {
	return $a if $a eq 'winner';
	return $b if $b eq 'winner';
	return $a if $a eq 'loser';
	return $b if $b eq 'loser';
	return $a if $a;
	return $b if $b;
}


for my $member (keys %members) {
	my $card = $card->{$member};
	my $grade = reduce {takeWin} "quitter", @$card;
	$report->{grade}->{$member} = $results->{$grade};
}

print Dump $report;

=head1 NAME

grade_bett.pl - record results from bett DB

=head1 SYNOPSIS

perl script/grade_bett.pl -l FIA0034 -x adventure -q 4 -l 1 -w 2 > /home/drbean/002/FIA0034/homework/2.yaml

=head1 DESCRIPTION

SELECT * FROM {wh,yn,s} WHERE league='FIA0034';

People who quit with q good questions get a score, perhaps. Players who get to GAME OVER, but who fail to be winners, ie are losers, get l points, and winners get w points.

Output numbers of grammatically-correct questions, correct answers, questions attempted in the wh, yn and s courses.

If correct question quota is filled, but answer quota not filled, player is treated as Loser, not Quitter.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
