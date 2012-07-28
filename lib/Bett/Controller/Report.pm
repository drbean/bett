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
        $c->stash->{email} = {
                to => "drbean\@freeshell.org",
                from => "greg\@nuu.edu.tw",
                subject => "Bett Error Report from $player",
                body => "
Player        : $player
Course        : $course
question      : $question
expectedcourse: $expectedcourse
myanswer      : $myanswer
theanswer     : $theanswer
info          : $info
email         : $email
"
                };
$DB::single=1;
        $c->forward( $c->view('Email') );
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
