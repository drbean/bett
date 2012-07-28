package Bett::View::Email;

use strict;
use base 'Catalyst::View::Email';

__PACKAGE__->config(
    stash_key => 'email',
    sender => {
    mailer => 'SMTP',
    mailer_args => {
        Host     => 'smtp.example.com',
        username => 'username',
        password => 'password',
        }
    }
);

=head1 NAME

Bett::View::Email - Email View for Bett

=head1 DESCRIPTION

View for sending email from Bett. 

=head1 AUTHOR

Dr Bean

=head1 SEE ALSO

L<Bett>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
