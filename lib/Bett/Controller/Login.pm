package Bett::Controller::Login;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Bett::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
	my ( $self, $c ) = @_;
	my $username = $c->request->params->{username};
	my $password = $c->request->params->{password};
	my $exercise = $c->request->query_params->{exercise};
	$c->session->{exercise} = "clay";
	$c->session->{league} = "GL00005";
	if ($username && $password) {
		if ($c->authenticate({ id => $username,
				  password => $password  } )) {
			$c->session->{player_id} = $username;
			$c->response->redirect($c->uri_for(
				"/game"));
			return;
		} else {
			$c->stash(error_msg =>
				"Bad username or password.");
		}
	} else {
		$c->stash(error_msg =>
			"Empty username or password.")
		unless ($c->user_exists);
	}
	$c->stash(template => 'login.tt2');
}

=head2 gameRedirect

End of chain. Game or game list, depending on whether exercise session key set.

=cut

sub gameRedirect :Chained('index') :PathPart('') :Args(0) {
	my ($self, $c) = @_;
       # if ( defined $c->session->{exercise} ) {
		my $exercise = $c->session->{exercise};
		$c->response->redirect(
			$c->uri_for("/game/$exercise"), 303 );
	# }
	#else {
	#	$c->response->redirect( $c->uri_for("/game/list"),
	#		303 );
	#}
	#return;
}
   

=head2 logout

Logout logic

=cut

sub logout :Global {
	my ($self, $c) = @_;
	$c->logout;
	$c->response->redirect($c->uri_for('/'));
}


=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
