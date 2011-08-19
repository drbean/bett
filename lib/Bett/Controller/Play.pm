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
	my ($self, $c, $mycourse) = @_;
        my $player = $c->session->{player_id};
	my $league = $c->session->{league};
	my $exercise = $c->session->{exercise};
	for my $allcourse ( 'WH', 'YN', 'S' ) {
		my $standing = $c->model("DB::$allcourse")
			->find({ player => $player,
			exercise => $exercise,
			league => $league });
		if ( $standing->questionchance < 0 or 
			$standing->answerchance < 0 ) {
			$c->response->body('GAME OVER');
			$c->detach();
		}
		$c->stash($allcourse => $standing);
	}
	$c->stash(course => $mycourse);
	$c->stash(player => $player);
	$c->stash(exercise => $exercise);
	$c->stash(league => $league);
}

=head2 wordschars

=cut

sub wordschars :Chained('setup') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $exercise = $c->stash->{exercise};
	my @chars = $c->model('DB::Character')->
		search({ exercise => $exercise})->
		get_column("string")->all;
	$c->stash->{ characters } = \@chars;
	$c->stash->{words} = 
		$c->model('DB::Word')->find(
		{exercise => $exercise})->string;
}

=head2 try

Course, question, answer and Questioner's course and answer.

=cut

sub try :Chained('wordschars') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	if ( $c->request->params ) {
		my $course = $c->stash->{course};
		my $question = $c->request->params->{question};
		my $myanswer = $c->request->params->{answer};
		unless ( $question )
		{
			$c->stash->{error_msg} = "Enter a question and answer.";
			$c->detach('exchange');
		}
		my $check =
qx"echo $question | ../class/conversation/marriage/Questioner";
		my ($unknown, $unhandled, $lexed, $expectedcourse,
			$theanswer) = (undef)x4;
		if ( $check =~ m/^Questioner: Unknown words: ["(.*)"]$/ ) {
			$unknown = $1;
		}
		elsif ( $check =~ m/Non-exhaustive patterns in/ ) {
			$unhandled =1;
		}
		else {
			($lexed, $expectedcourse, $theanswer) =
						split /\n/, $check; 
		}
		$c->stash( lexed => $lexed );
		$c->stash( question => $question );
		$c->stash( myanswer => $myanswer );
		$c->stash( theanswer => $theanswer );
		$c->stash( unknown => $unknown );
		$c->stash( unhandled => $unhandled );
		$c->stash( expectedcourse => $expectedcourse );
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
	my $theanswer = $c->stash->{theanswer};
	my $myanswer = $c->stash->{myanswer};
	my $unknown = $c->stash->{unknown};
	my $unhandled = $c->stash->{unhandled};
	if ( $course and $course ne $expectedcourse ) {
		$c->stash->{error_msg} =
"'$question' is not a $translate{$course}. It's a $translate{$expectedcourse}. Try again.";
		$c->stash->{err} = "question";
	}
	elsif ( $theanswer and $myanswer ne $theanswer ) {
		$c->stash->{error_msg} =
"The answer to '$question' is not '$myanswer. It's '$theanswer'. Try again.";
		$c->stash->{err} = "answer";
	}
	elsif ( $unknown ) {
		$c->stash->{error_msg} = "'$unknown' are unknown words. Use only the words from the list."
	}
	elsif ( $unhandled ) {
		$c->stash->{error_msg} = "The question, '$question' was a correct question, but Bett doesn't know the answer."
	}
	elsif ( $myanswer eq $theanswer ) {
		$c->stash->{status_msg} = "The question, '$question' was a grammatical question, and the answer, $theanswer was the correct answer to that question."
	}
	else {
		die "$question' and '$myanswer'?";
	}
}

=head2 update

=cut

sub update :Chained('evaluate') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $player = $c->stash->{ player };
	my $exercise= $c->stash->{exercise };
	my $league= $c->stash->{ league };
	my $course = $c->stash->{course};
	my $cOURSE = ucfirst ( lc $course );
	my $standing = $c->stash->{$course};
	my $err = $c->stash->{err};
	my $unknown = $c->stash->{unknown};
	my $unhandled = $c->stash->{unhandled};
	my $tries = $c->stash->{tries};
	my $score = $c->stash->{score};
	if ( $err and $err eq 'question' ) {
		$standing->update({
			try => ($tries + 1),
			questionchance =>
				($standing->questionchance - 1),
			});
	}
	elsif ( $err and $err eq 'answer' ) {
		$standing->update({
			try => ($tries + 1),
			answerchance =>
				($standing->answerchance - 1),
			});
	}
	elsif ( $unknown or $unhandled ) {
		1;
	}
	elsif ( $c->stash->{myanswer} eq $c->stash->{theanswer} ) {
		$standing->update({
			try => ($tries + 1),
			score => ($score + 1),
			});
	}
	else {
		$c->stash->{error_msg} = "Impossible question, or answer!";
	}
}

=head2 save

New questions, answers

=cut

sub save :Chained('update') :PathPart('') :Args(0) {
my ( $self, $c ) = @_;
	my $course = $c->stash->{course};
	my $player = $c->stash->{ player };
	my $exercise= $c->stash->{exercise };
	my $league= $c->stash->{ league };
	my $standing = $c->stash->{$course};
	$c->model('DB::Question')->update_or_create({
		player => $player,
		league => $league,
		exercise => $exercise,
		lexed => $c->stash->{lexed},
		quoted => $c->stash->{question},
		course => $course,
		grammatical => 1,
		});
	my %standing = (
		tries => $standing->try,
		score => $standing->score,
		questions => $standing->questionchance,
		answers => $standing->answerchance);
	$c->stash({ standing => \%standing });
	if ( $standing{questions} < 0 or 
		$standing{answers} < 0 ) {
		$c->response->body('GAME OVER');
	}
	else {
		$c->stash->{ config } = $c->config;
		$c->stash->{ template } = 'play.tt2';
	}
}

=head2 exchange

GAME OVER, or loop back to REPL.

=cut

sub exchange :Chained('save') :PathPart('') :Args(0) {
my ( $self, $c ) = @_;
	my $course = $c->stash->{course};
	my $standing = $c->stash->{$course};
	my %standing = (
		tries => $standing->try,
		score => $standing->score,
		questions => $standing->questionchance,
		answers => $standing->answerchance);
	$c->stash({ standing => \%standing });
	if ( $standing{questions} < 0 or 
		$standing{answers} < 0 ) {
		$c->response->body('GAME OVER');
	}
	else {
		$c->stash->{ config } = $c->config;
		$c->stash->{ template } = 'play.tt2';
	}
}

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
