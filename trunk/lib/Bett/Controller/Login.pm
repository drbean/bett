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
	if ($username && $password) {
		if ($c->authenticate({ id => $username,
				  password => $password  } )) {
			$c->response->redirect($c->uri_for(
			   $c->controller('Game')
				->action_for('index')));
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
