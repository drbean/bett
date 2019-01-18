#!perl

use strict;
use warnings;
use lib '/home/drbean/bett/lib';
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

my $config = LoadFile "/home/drbean/bett/bett.yaml";
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $id = $script->league;
my $exercise = $script->exercise;
my $try = $script->try;
my $grammatical = $script->grammatical;
my $correct = $script->response;
my @courses = qw/Wh Yn/;
my %results = (try => $try, grammatical => $grammatical, correct => $correct);
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
my $total = { question => 0, grammatical => 0, answer => 0
			, total => 0, grade => 0 };
my $n = scalar keys %members;
$report->{exercise} = $exercise;
for my $player ( keys %members ) {
	my $try = $schema->resultset('Try')->count({
		exercise => $exercise,
		player => $player
		},
		{ columns => qw/quoted/,
		distinct => 1 });
	$report->{points}->{$player}->{try} = $try;
	$total->{question} += $try;
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
	$total->{grammatical} += $question;
	$card->{$player} = $results{try} * $try + $results{grammatical} * $question;
	for my $course ( @courses ) {
		my $score;
		my $work = $schema->resultset($course)->find({
			league => $id
			, exercise => $exercise
			, player => $player });
		if ( $work != 0 ) {
			$score = $work->get_column('score');
			$total->{answer} += $score;
		}
		else { $score = 0; }
		$report->{points}->{$player}->{answer} += $score;
	}
	$card->{$player} += $results{correct} * $report->{points}->{$player}->{answer};
	$total->{total} += $card->{$player};
}

my @triers = grep { $card->{$_} != 0 } keys %$card;
my @nonzeros = @$card{@triers};
my $median = (sort {$a <=> $b} @nonzeros)[ @nonzeros/2 ] || 1;
my $max_points = max values %$card;
my $grade_sum = 0;
my $participants = 0;

for my $member (keys %members) {
	my $my_card = $report->{grade}->{$member};
	if ( defined $my_card and $my_card == 0 ) {
		next;
	}
	elsif ( $card->{$member} > $median ) {
		$report->{grade}->{$member} = 4 + 1 * ($card->{$member} - $median) / ($max_points - $median);
	}
	elsif ( $card->{$member} <= $median ) {
		$report->{grade}->{$member} = 0 + 4 * $card->{$member} / $median;
	}
	else {
		die "No card.member, no report.grade.member?\n"; 
	}
	$grade_sum += $report->{grade}->{$member};
	$participants++;
}

$total->{grade} = $participants ? $grade_sum / $participants : 0;

print Dump $report;
print "report: |+\n";
print "  $_: $results{$_}\n" for keys %results;

STDOUT->autoflush;
$^L='';

format STDOUT_TOP =
  Player     Question Grammatical Answers   Total     Grade
.

for my $member (sort keys %members) {

format STDOUT = 
@<@<<<<<<<<<< @###      @##       @##       @##       @#.#
{ "  ", $member, $report->{points}->{$member}->{try}
	, $report->{points}->{$member}->{question}
	, $report->{points}->{$member}->{answer}
	, $card->{$member}
	, $report->{grade}->{$member}
	}
.

	write;
}

$^='TOTAL_TOP';
$~='TOTAL';
$^L="\f";

format TOTAL_TOP =
  Class Totals
             Question Grammatical Answers   Total     Grade
.

format TOTAL = 
  Class Totals
             Question Grammatical Answers   Total     Grade
@<@<<<<<<<<<< @###      @####     @####     @####     @#.#
{ "", "", $total->{question}
	, $total->{grammatical}
	, $total->{answer}
	, $total->{total}
	, $total->{grade}
	}
.
write;

print Dump $report->{grade};

=head1 NAME

comp_grade_bett.pl - record results from bett DB competition

=head1 SYNOPSIS

perl script/comp_grade_bett.pl -l FIA0034 -x adventure -t 1 -g 1 -r 1 > /home/drbean/002/FIA0034/exam/2/g.yaml

=head1 DESCRIPTION

SELECT * FROM {try,wh,yn,tag} WHERE league='FIA0034';

t points for trying a (non-blank) question. g points for a grammatical question. r points for a grammatical question with a correct answer.

The person with most points get a perfect grade. Everyone who attends gets at least 20 percent. Non-attenders get zero.

The median scorer gets 80 percent, which will prevent the high fliers depressing the low scorers' grades.

Output numbers of grammatically-correct questions, correct answers, questions attempted in the wh, yn and s courses.

Append a report of players, question, grammatical, answer with format. This will include a linefeed (^L) which will need to be deleted.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
