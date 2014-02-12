#!perl

=head1 NAME

script_files/scores.pl - Dump scores of players in leagues

=head1 SYNOPSIS

script_files/scores.pl GL00006

 FLA0018		eden-1	eden-2	Total
 ============================================
 N9461736	80	155	235	
 N9461738	106	219	325	
 
=head1 DESCRIPTION

Dumps scores to standings.yaml in present directory and prints to STDOUT. No attention is paid to what the League schema tells us about what leagues and what exercises and what course exist at present. Old leagues and exercises and what course may have been deleted, but their players and exercise play results remain (unless a different exercise with the same name as a deleted one is added later?). A schema exercise without scores will still be included in the computed scores. Needs to be refactored when Genre schema is produced.

=head1 AUTHOR

Sebastian Riedel, C<sri@oook.de>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

use strict;
use warnings;
use FindBin qw/$Bin/;
use lib "$Bin/../lib";

use Config::General;
use List::MoreUtils qw/any uniq/;
use YAML qw/DumpFile/;
use IO::All;
use Cwd; use File::Basename;
use Bett;
use Net::FTP;

my $id = $ARGV[0] || basename( getcwd );

my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );
my $playset = $schema->resultset('Wh');
my $league;
$league = $schema->resultset('League')->find({ id => $id }) if $id;
my ($genre, @newExerciseList);
if ( $league ) {
	$genre = $league->get_column('genre');
	@newExerciseList = uniq $schema->resultset('Exercise')->search({ genre =>
		$genre })->get_column('id')->all;
}
my @playingleagues = uniq $playset->get_column('league')->all;
my @leagues = (any { $_ eq $id } @playingleagues) ? ( $id ): @playingleagues;
@leagues = qw/AFN3Y0/;
my @exerciseIds = $playset->get_column('exercise')->all;
# @exerciseIds = uniq sort @exerciseIds;
@exerciseIds = qw/q-and-a-exam/;
my $remote = "standings.txt";
my $local = $genre? "/tmp/$genre/$remote": "/tmp/$remote";

my $ftp = Net::FTP->new('web.nuu.edu.tw') or die "web.nuu.edu.tw? $@";
$ftp->login('greg', '6y6t6y6t') or die "web.nuu.edu.tw login? $@";
if ( $genre ) {
	$ftp->cwd("public_html/$genre") or die
		"web.nuu.edu.tw/~greg/public_html/$genre? $@";
}
else {
	$ftp->cwd("public_html") or die
		"web.nuu.edu.tw/~greg/public_html? $@";
}

my $io = io($local) or die "No score print to $local? $@";
my $output = "Standings\n";
my $scores;
for my $id ( 'AFN3Y0' )
{
	my @leagueExercises;
	@leagueExercises = @newExerciseList if $league;
	# my $leagueplay = $playset->search({ league => $id });
	my $wh = $schema->resultset('Wh');
	my $yn = $schema->resultset('Yn');
	my $tag = $schema->resultset('Tag');
	my $league = $schema->resultset('League')->find({ id => $id });
	# push @leagueExercises, $leagueplay->get_column('exercise')->all;
	@leagueExercises = uniq @leagueExercises;
	@leagueExercises = qw/alex cindy dave jeff kelly mindy neil rena shane vicky/;
	# $output .= join "\t", $id."\t", @leagueExercises, "Total\n";
	$output .= join "\t", $id."\t", "WH", "YN", "TAG", "Total\n";
	$output .= "============================================\n";
	#my $play = $leagueplay->search( [
	#		{exercise => 'alex'},
	#		{exercise => 'cindy'},
	#		{exercise => 'dave'},
	#		{exercise => 'jeff'},
	#		{exercise => 'kelly'},
	#		{exercise => 'mindy'},
	#		{exercise => 'neil'},
	#		{exercise => 'rena'},
	#		{exercise => 'shane'},
	#		{exercise => 'vicky'},
	#		 ],
	#	{ select => [ 'player', 'exercise', { sum => 'correct' } ],
	#	'group_by' => [qw/player exercise/],
	#	as => [ qw/player exercise score/ ],
	#	'order_by' => 'player' });
	#while ( my $result = $play->next )
	#{
	#	my $player = $result->get_column('player');
	#	my $exercise = $result->exercise;
	#	my $score = $result->get_column('score');
	#	$scores->{$id}->{$player}->{$exercise} = $score;
	#	$scores->{$id}->{$player}->{Total} += $score;
	#}
	my $exercise = 'q-and-a-exam';
	my $member = $schema->resultset('Member')->search(
		{league => $id });
	my @player_ids;
	while ( my $member = $member->next )
	{
		my $player = $member->id;
		push @player_ids, $player;
		for my $course_name ( qw/wh yn tag/ )
		{
			my $course = $course_name eq 'wh'? $wh:
				$course_name eq 'yn'? $yn:
					$tag;
			my $play = $course->find(
				{player => $player, exercise => $exercise});
			next unless $play;
			$scores->{$id}->{$player}->{$course_name}->{try} = $play->try;
			$scores->{$id}->{$player}->{$course_name}->{score} = $play->score;
			$scores->{$id}->{$player}->{Total} +=
				$scores->{$id}->{$player}->{$course_name}->{score};
		}
	}
	for my $player ( uniq sort @player_ids ) {
		$output .= $player . "\t";
		for my $course ( qw/wh yn tag/ ) {
			my $try = $scores->{$id}->{$player}->{$course}->{try};
			my $score = $scores->{$id}->{$player}->{$course}->{score};
			$try //= '-';
			$score //= '-';
			my $entry = $score . '/' . $try;
			$output .= $entry . "\t";
		}
		$output .= $scores->{$id}->{$player}->{Total};
		$output .= "\n";
	}
	$output .= "\n";

	$io->print( $output );

	$ftp->binary;
}

io('-')->print( $output );
$io->close;
	$ftp->put($local) or die "put $remote on web.nuu.edu.tw? $@";

