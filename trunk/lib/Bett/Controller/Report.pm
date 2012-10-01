package Bett::Controller::Report;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Bett::Controller::Report - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=cut

=head2 course

Session and course

=cut

sub course :Path('/report') {
	my ($self, $c, $mycourse, $question, $myanswer, $theanswer, $expectedcourse, $status_msg, $error_msg) = @_;
        my $player = $c->session->{player_id};
	my $league = $c->session->{league};
	my $exercise = $c->session->{exercise};
	$c->stash(player => $player);
	$c->stash(exercise => $exercise);
	$c->stash(league => $league);
	$c->stash(course => $mycourse);
	$c->stash(question => $question);
	$c->stash(myanswer => $myanswer);
	$c->stash(theanswer => $theanswer);
	$c->stash(expectedcourse => $expectedcourse);
	$c->stash(status => $status_msg);
	$c->stash(error => $error_msg);
	$c->stash->{ template } = 'report.tt2';
}

=head2 email

Email report to drbean

=cut

sub email :Local {
	my ( $self, $c ) = @_;
	my $params = $c->request->params;
	my ($player, $course, $question, $expectedcourse,
		$myanswer, $theanswer, $status, $error, $info, $email) =
		@$params{qw/player course question expectedcourse
		myanswer theanswer status error info email/};
	my $league = $c->session->{league};
	my $exercise = $c->session->{exercise};
	$c->stash(exercise => $exercise);
	$c->stash->{email} = {
	header => [ 'Reply-To' => $email ],
			to       => "drbean\@freeshell.org",
			from     => "greg\@nuu.edu.tw",
			subject  => "Bett $exercise Problem, $player: $question",
			body     => "
Exercise      : $exercise
Player        : $player
Course        : $course
Question      : $question
Question type : $expectedcourse
Your answer   : $myanswer
Bett's answer : $theanswer
Status message: $status
Error message : $error
Your comment  : $info
Your email    : $email
"
                };
	$c->forward( $c->view('Email') );
	if ( scalar( @{ $c->error } ) ) {
		$c->error(0);
		$c->response->body('Bett can\'t send an email to Dr Bean at the moment. There\'s something wrong with Dr Bean\'s server or the network. Please try contacting him yourself at <A href="mailto:drbean@freeshell.org" subject=\"$exercise $course problem\">drbean@freeshell.org</A>');
	} else {
		$c->stash->{status_msg} = 'Dr Bean has been informed about the problem. If he agrees that Bett made an error, he will give you credit for your question and answer. Meanwhile, try continuing writing questions and answers.';
	}
	$c->stash( course => $course );
	my $standing = $c->model("DB::$course")
		->find({ player => $player,
		exercise => $exercise,
		league => $league });
	$c->stash( $course => $standing );
	my $questions = $c->model('DB::Question')->search({
		league => $league,
		exercise => $exercise,
		});
	my @goodqns = $questions->search({grammatical => 1})->all;
	my @badqns = $questions->search({ grammatical => 0})->all;
	$c->stash(goodqn => \@goodqns);
	$c->stash(badqn => \@badqns);
			#[{ quoted => "fdsfds", player => 'N9741065'}]);
	my $win = $c->config->{$course}->{win};
	$c->stash->{win} = $win;
	if ( $standing->questionchance < 0 or 
		$standing->answerchance < 0 ) {
		$c->stash->{ template } = 'over.tt2';
	}
	elsif ( $standing->score >= $win ) {
		$c->stash->{ template } = 'over.tt2';
	}
	elsif ( $c->stash->{gameover} ) {
		$c->stash->{ template } = 'over.tt2';
	}
	else {
		$c->stash->{ config } = $c->config;
$DB::single=1;
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
