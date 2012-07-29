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

sub course :Chained('/') :PathPart('report') :CaptureArgs(1) {
	my ($self, $c, $mycourse) = @_;
        my $player = $c->session->{player_id};
	my $league = $c->session->{league};
	my $exercise = $c->session->{exercise};
	$c->stash(player => $player);
	$c->stash(exercise => $exercise);
	$c->stash(league => $league);
	$c->stash(course => $mycourse);
}

=head2 question

URL-escaped original string

=cut

sub question :Chained('course') :PathPart('') :CaptureArgs(1) {
	my ( $self, $c, $question ) = @_;
	$c->stash(question => $question);
}

=head2 myanswer

URL string

=cut

sub myanswer :Chained('question') :PathPart('') :CaptureArgs(1) {
	my ( $self, $c, $myanswer ) = @_;
	$c->stash(myanswer => $myanswer);
}

=head2 theanswer

URL string

=cut

sub theanswer :Chained('myanswer') :PathPart('') :CaptureArgs(1) {
	my ( $self, $c, $theanswer ) = @_;
	$c->stash(theanswer => $theanswer);
}

=head2 expectedcourse

URL string

=cut

sub expectedcourse :Chained('theanswer') :PathPart('') :CaptureArgs(1) {
	my ( $self, $c, $expectedcourse ) = @_;
	$c->stash(expectedcourse => $expectedcourse);
}

=head2 compile

Compile report

=cut

sub compile :Chained('expectedcourse') :PathPart('') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{ template } = 'report.tt2';
}

=head2 email

Email report to drbean

=cut

sub email :Local {
	my ( $self, $c ) = @_;
	my $params = $c->request->params;
	my ($player, $course, $question, $expectedcourse,
		$myanswer, $theanswer, $info, $email) =
		@$params{qw/player course question expectedcourse
		myanswer theanswer info email/};
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
	$c->stash->{ course } = $course;
	$c->stash->{ template } = 'play.tt2';
}
=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
