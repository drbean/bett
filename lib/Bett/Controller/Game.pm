package Bett::Controller::Game;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Bett::Controller::Game - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( config => $c->config );
    $c->stash( template => 'exchange.tt2' );
}

=cut

=head2 base

Can place common logic to start chained dispatch here

=cut

sub base :Chained('/') :PathPart('game') :CaptureArgs(1) {
	my ($self, $c, $exercise) = @_;
	$c->stash(game => $c->model('DB::Game'));
	$c->stash(play => $c->model('DB::Play'));
	$c->stash(exercise => $exercise);
	my @chars = $c->model('DB::Character')->
		search({ exercise => $exercise})->
		get_column("string")->all;
	$c->stash( characters => \@chars );
}

=head2 exchange

=cut

sub exchange :Chained('words') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( config => $c->config );
    $c->stash( template => 'exchange.tt2' );
}

=head2 words

=cut

sub words :Chained('base') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $exercise = $c->stash->{exercise};
	$c->stash(words => 
		$c->model('DB::Word')->find(
		{exercise => $exercise})->string );
}

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
