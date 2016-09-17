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

Initialize games for player in exercise.

=cut

sub setup :Chained('/') :PathPart('game') :CaptureArgs(0) {
	my ($self, $c) = @_;
	my $player = $c->session->{player_id};
	my $exercise = $c->session->{exercise};
	my $league = $c->session->{league};
	my %standing;
	for my $course ( "WH", "YN", "Tag" ) {
		my $chances = $c->config->{$course}->{chances};
		my $cOURSE = ucfirst ( lc $course );
		my $standing = $c->model("DB::$cOURSE")
			->find_or_create({ player => $player,
			exercise => $exercise,
			league => $league,
			try => 0,
			score => 0,
			questionchance => $chances->{question},
			answerchance => $chances->{answer}
			});
		my %standing = (
			tries => $standing->try,
			score => $standing->score,
			questions => $standing->questionchance,
			answers => $standing->answerchance);
		$c->stash( $course => \%standing );
	}
	$c->stash(exercise => $exercise);
	$c->stash(player => $player);
	$c->stash(league => $league);
}

=head2 wordschars

=cut

sub wordscharssentences :Chained('setup') :PathPart('') :CaptureArgs(0) {
	my ( $self, $c ) = @_;
	my $exercise = $c->stash->{exercise};
	my @chars = $c->model('DB::Character')->
		search({ exercise => $exercise})->
		get_column("string")->all;
	$c->stash( characters => \@chars );
	$c->stash(words => 
		$c->model('DB::Word')->find(
		{exercise => $exercise})->string );
	$c->stash(sentences => 
		$c->model('DB::Sentence')->find(
		{exercise => $exercise})->string );
}

=head2 exchange

=cut

sub exchange :Chained('wordscharssentences') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( config => $c->config );
    $c->stash( template => 'game.tt2' );
}

=head2 words

=cut

sub words :Global {
    my ( $self, $c ) = @_;
	my $exercise = $c->session->{exercise};
	my $words = $c->model('DB::Word')->find({ exercise => $exercise })->string;
    $c->response->body( $words );
}

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
