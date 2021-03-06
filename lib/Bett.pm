package Bett;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    ConfigLoader

 -Debug
 Static::Simple
 StackTrace



	Authentication
	Authorization::Roles

	Session
	Session::Store::DBIC
	Session::State::Cookie
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in bett.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Bett',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
);

__PACKAGE__->config->{'Plugin::Authentication'} = {
	default_realm => 'dbic',
	realms => {
		dbic => {
			credential => {
				class => 'Password',
				password_field => 'password',
				password_type => 'clear'
			},
			store => {
				class => 'DBIx::Class',
				user_model => 'DB::Player',
				role_relation => 'getrole',
				role_field => 'id',
			}
		}
	}
};

__PACKAGE__->config->{'Plugin::Session'} = {
		dbic_class	=> 'DB::Session',
		expires	=> 3600
};

__PACKAGE__->config(
    default_view => 'HTML',
    'View::HTML' => {
        #Set the location for TT files
        INCLUDE_PATH => [
            __PACKAGE__->path_to( 'root', 'src' ),
        ],
    },
    'View::Email' => {
       stash_key => 'email',
       default => {
           content_type => 'text/plain',
           charset => 'utf-8'
       },
       sender => {
           mailer => 'Sendmail',
           mailer_args => {
    	   Host     => 'localhost',
		   # username => 'greg',
    	   # password => '',
       }
     }
}
);
 
# Start the application
__PACKAGE__->setup();


=head1 NAME

Bett - Catalyst based application

=head1 SYNOPSIS

    script/bett_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Bett::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
