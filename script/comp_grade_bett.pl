#!perl

use strict;
use warnings;
use lib 'lib';
use FindBin '$Bin';
use Pod::Usage;

use Config::General;
use YAML qw/Bless Dump LoadFile/;
use List::Util qw/reduce max sum/;
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
has 'try' => (
    traits => ['Getopt'], is => 'ro', isa => 'Int', required => 0,
    cmd_aliases => 't',);
has 'grammatical' => (
    traits => ['Getopt'], is => 'ro', isa => 'Int', required => 0,
    cmd_aliases => 'g',);
has 'response' => (
    traits => ['Getopt'], is => 'ro', isa => 'Int', required => 0,
    cmd_aliases => 'r',);

package main;

my $config = LoadFile "bett.yaml";
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $id = $script->league;
my $exercise = $script->exercise;
my $try = $script->try;
my $grammatical = $script->grammatical;
my $correct = $script->response;
my @courses = qw/Wh Yn/;
my $results = { try => $try, grammatical => $grammatical, correct => $correct };
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
for my $player ( keys %members ) {
	my $try = $schema->resultset('Try')->count({
		exercise => $exercise,
		player => $player
		},
		{ columns => qw/quoted/,
		distinct => 1 });
	$report->{points}->{$player}->{try} = $try;
	if ( $try == 0 ) {
		$report->{points}->{$player}->{question} = 0;
		$report->{points}->{$player}->{answer} = 0;
		$card->{$player} = 0;
		$report->{grade}->{$player} = 0;
		next;
	}
	my $question = $schema->resultset('Question')->count({
		league => $id,
		exercise => $exercise,
		player => $player,
		grammatical => 1 });
	$report->{points}->{$player}->{question} = $question;
	$card->{$player} = $try + $question;
	for my $course ( @courses ) {
		my $score;
		my $work = $schema->resultset($course)->find({
			league => $id
			, exercise => $exercise
			, player => $player });
		if ( $work != 0 ) {
			$score = $work->get_column('score');
		}
		else { $score = 0; }
		$report->{points}->{$player}->{answer} += $score;
	}
	$card->{$player} += $report->{points}->{$player}->{answer};
}

my $max_points = max values %$card;

for my $member (keys %members) {
	my $my_card = $report->{grade}->{$member};
	if ( defined $my_card and $my_card == 0 ) {
		next;
	}
	else {
		$report->{grade}->{$member} = 60 + 40 * $card->{$member} / $max_points;
	}
}

my $yaml;
open YAML, '>', \$yaml or die "No \$yaml?";
format YAML_TOP =
  Player   Question Grammatical Answers Total Grade
.

for my $member (sort keys %members) {

format YAML = 
@<<<<, @<<<<<<<<<< @###      @##       @##       @##       @##
{ "    ", $member, $report->{points}->{$member}->{try}
	, $report->{points}->{$member}->{question}
	, $report->{points}->{$member}->{answer}
	, $card->{$member}
	, $report->{grade}->{$member}
	}
.

	write YAML;
}

local $YAML::UseBlock = 1;
local $YAML::UseFold = 1;
$report->{report} = $yaml;
print Dump $report;

=head1 NAME

comp_grade_bett.pl - record results from bett DB competition

=head1 SYNOPSIS

perl script/comp_grade_bett.pl -l FIA0034 -x adventure -t 1 -g 1 -r 1 > /home/drbean/002/FIA0034/exam/2/g.yaml

=head1 DESCRIPTION

SELECT * FROM {try,wh,yn,tag} WHERE league='FIA0034';

t points for trying a (non-blank) question. g points for a grammatical question. r points for a grammatical question with a correct answer.

The person with most points get a perfect midterm grade. Everyone who attends gets at least 60 percent. Non-attenders get zero.

Output numbers of grammatically-correct questions, correct answers, questions attempted in the wh, yn and s courses.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
