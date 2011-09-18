package Bett::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

# use Bett;

# my $name = Bett->config->{database};
my $name = "bett001";

__PACKAGE__->config(
    schema_class => 'Bett::Schema',
    
    connect_info => {
        dsn => "dbi:Pg:dbname=$name",
        user => '',
        password => '',
    }
);

=head1 NAME

Bett::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<Bett>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Bett::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.52

=head1 AUTHOR

Dr Bean

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;