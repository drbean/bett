package Bett::Controller::Play;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Bett::Controller::Play - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


#=head2 index
#
#=cut
#
#sub index :Path :Args(0) {
#    my ( $self, $c ) = @_;
#    $c->stash( config => $c->config );
#    $c->stash( template => 'exchange.tt2' );
#}

=cut

=head2 setup

Session and WH, YN, S standing.

=cut

sub setup :Chained('/') :PathPart('play') :CaptureArgs(1) {
	my ($self, $c, $course) = @_;
        my $player = $c->session->{player_id};
	my $league = $c->session->{league};
	my $exercise = $c->session->{exercise};
	my $cOURSE = ucfirst ( lc $course );
my $log = $c->log;
$log->info("course: $cOURSE, $course");
	my $standing = $c->model("DB::$cOURSE")
		->find({ player => $player,
		exercise => $exercise,
		league => $league });
	$c->stash(course => $course);
	$c->stash($course => $standing);
	$c->stash(player => $player);
	$c->stash(exercise => $exercise);
	$c->stash(league => $league);
}

=head2 try

Course, question, answer and Questioner's course and answer.

=cut

sub try :Chained('setup') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	if ( $c->request->params ) {
		my $course = $c->stash->{course};
		my $question = $c->request->params->{question};
		my $myanswer = $c->request->params->{answer};
		unless ( $course or $question or $myanswer )
		{
			$c->stash->{error_msg} = "Missing question/answer?";
			$c->detach('exchange');
		}
		my $check = qx"echo $question | ../class/conversation/marriage/Questioner";
		my ($unknown, $unhandled, $expectedcourse,
			$theanswer) = (undef)x4;
		if ( $check =~ m/^Questioner: Unknown words: ["(.*)"]$/ ) {
			$unknown = $1;
		}
		elsif ( $check =~ m/Non-exhaustive patterns in/ ) {
			$unhandled =1;
		}
		else {
			($expectedcourse, $theanswer) =
						split /\n/, $check; 
			$c->stash->{status_msg} =
					"$course\n$theanswer.";
		}
		$c->stash( question => $question );
		$c->stash( myanswer => $myanswer );
		$c->stash( unknown => $unknown );
		$c->stash( unhandled => $unhandled );
		$c->stash( expectedcourse => $expectedcourse );
		$c->stash( theanswer => $theanswer );
	}
}

=head2 evaluate

=cut

sub evaluate :Chained('try') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my %translate = ( WH => 'WH-question',
		YN	=> 'YN-question',
		S	=> 'True/False question' );
	my $course = $c->stash->{course};
	my $expectedcourse = $c->stash->{expectedcourse};
	my $question = $c->stash->{question};
	if ( $course ne $expectedcourse ) {
		$c->stash->{error_msg} =
"'$question' is not a $translate{$course}. It's a $translate{$expectedcourse}. Try again.";
		$c->detach('exchange');
	}
	my $player = $c->stash->{ player };
	my $exercise= $c->stash->{exercise };
	my $league= $c->stash->{ league };
	my $chances = $c->config->{$course}->{chances};
	my $cOURSE = ucfirst ( lc $course );
	my $standing = $c->stash->{$course};
	my $try = $standing->try + 1;
	my $score = $standing->score + 1;;
	$standing->update({
		try => $try,
		score => $score,
		questionchance => 0,
		answerchance => 3
		});
	my %standing = (
		tries => $try,
		score => $score,
		questions => $standing->questionchance,
		answers => $standing->answerchance);
	$c->stash( $course => \%standing );
}

=head2 update

=cut

sub update :Chained('evaluate') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $player = $c->stash->{ player };
	my $exercise= $c->stash->{exercise };
	my $league= $c->stash->{ league };
	for my $course ( "WH", "YN", "S" ) {
		my $chances = $c->config->{$course}->{chances};
		my $cOURSE = ucfirst ( lc $course );
		my $standing = $c->stash->{$course};
		my $try = $standing->try + 1;
		my $score = $standing->score + 1;;
		$standing->update({
			try => $try,
			score => $score,
			questionchance => 0,
			answerchance => 3
			});
		my %standing = (
			tries => $try,
			score => $score,
			questions => $standing->questionchance,
			answers => $standing->answerchance);
		$c->stash( $course => \%standing );
	}
}

=head2 wordschars

=cut

sub wordschars :Chained('setup') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $exercise = $c->stash->{exercise};
	my @chars = $c->model('DB::Character')->
		search({ exercise => $exercise})->
		get_column("string")->all;
	$c->stash( characters => \@chars );
	$c->stash(words => 
		$c->model('DB::Word')->find(
		{exercise => $exercise})->string );
}

=head2 exchange

=cut

sub exchange :Chained('update') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( config => $c->config );
    $c->stash( template => 'play.tt2' );
}

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
