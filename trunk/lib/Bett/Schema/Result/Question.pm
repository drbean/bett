package Bett::Schema::Result::Question;

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

Bett::Schema::Result::Question

=cut

__PACKAGE__->table("question");

=head1 ACCESSORS

=head2 player

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 1

=head2 genre

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 0

=head2 text

  data_type: 'text'
  is_nullable: 0

=head2 league

  data_type: 'text'
  is_nullable: 0

=head2 exercise

  data_type: 'text'
  is_nullable: 0

=head2 course

  data_type: 'text'
  is_nullable: 1

=head2 quoted

  data_type: 'text'
  is_nullable: 1

=head2 grammar

  data_type: 'bool'
  is_nullable: 1

=head2 answer

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "player",
  { data_type => "text", is_foreign_key => 1, is_nullable => 1 },
  "genre",
  { data_type => "text", is_foreign_key => 1, is_nullable => 0 },
  "text",
  { data_type => "text", is_nullable => 0 },
  "league",
  { data_type => "text", is_nullable => 0 },
  "exercise",
  { data_type => "text", is_nullable => 0 },
  "course",
  { data_type => "text", is_nullable => 1 },
  "quoted",
  { data_type => "text", is_nullable => 1 },
  "grammar",
  { data_type => "bool", is_nullable => 1 },
  "answer",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("text", "exercise", "genre", "league");

=head1 RELATIONS

=head2 genre

Type: belongs_to

Related object: L<Bett::Schema::Result::Genre>

=cut

__PACKAGE__->belongs_to(
  "genre",
  "Bett::Schema::Result::Genre",
  { id => "genre" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 player

Type: belongs_to

Related object: L<Bett::Schema::Result::Member>

=cut

__PACKAGE__->belongs_to(
  "player",
  "Bett::Schema::Result::Member",
  { player => "player" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-11 07:21:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wQ2jXuqDe7prfvUEkGU2CA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
