package Bett::Schema::Result::Rolebearer;

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

Bett::Schema::Result::Rolebearer

=cut

__PACKAGE__->table("rolebearer");

=head1 ACCESSORS

=head2 player

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 0

=head2 role

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "player",
  { data_type => "text", is_foreign_key => 1, is_nullable => 0 },
  "role",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("player", "role");

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<Bett::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "Bett::Schema::Result::Role",
  { id => "role" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 player

Type: belongs_to

Related object: L<Bett::Schema::Result::Player>

=cut

__PACKAGE__->belongs_to(
  "player",
  "Bett::Schema::Result::Player",
  { id => "player" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-05 14:10:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fdOdwJgp8+AOKHNPCNtXNg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
