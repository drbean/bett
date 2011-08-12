package Bett::Schema::Result::Character;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 NAME

Bett::Schema::Result::Character

=cut

__PACKAGE__->table("character");

=head1 ACCESSORS

=head2 entity

  data_type: 'text'
  is_nullable: 0

=head2 string

  data_type: 'text'
  is_nullable: 1

=head2 exercise

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "entity",
  { data_type => "text", is_nullable => 0 },
  "string",
  { data_type => "text", is_nullable => 1 },
  "exercise",
  { data_type => "text", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("entity", "exercise");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-11 15:08:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+dpPHeiAfKfyfR+E9/4X5Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
