package Bett::Schema::Result::Exercise;

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 NAME

Bett::Schema::Result::Exercise

=cut

__PACKAGE__->table("exercise");
__PACKAGE__->add_columns(
  "type",
  { data_type => "VARCHAR", is_nullable => 0, size => 15 },
  "genre",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 15,
  },
  "id",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 15,
  },
  "description",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
);
__PACKAGE__->set_primary_key("genre", "id");

# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-09-22 15:03:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:56gkl7nOCoZnA1omiRu98A

#__PACKAGE__->belongs_to('of_genre', 'Bett::Schema::Result::Genre',
#		'value');

# You can replace this text with custom content, and it will be preserved on regeneration
1;
