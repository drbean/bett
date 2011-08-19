package Bett::Schema::Result::Play;

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

Bett::Schema::Result::Play

=cut

__PACKAGE__->table("play");

=head1 ACCESSORS

=head2 question

  data_type: 'text'
  is_nullable: 0

=head2 answer

  data_type: 'text'
  is_nullable: 1

=head2 player

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 0

=head2 league

  data_type: 'text'
  is_nullable: 0

=head2 course

  data_type: 'text'
  is_nullable: 0

=head2 try

  data_type: 'int'
  is_nullable: 1

=head2 score

  data_type: 'int'
  is_nullable: 1

=head2 questionchance

  data_type: 'int'
  is_nullable: 1

=head2 answerchance

  data_type: 'int'
  is_nullable: 1

=head2 exercise

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "question",
  { data_type => "text", is_nullable => 0 },
  "answer",
  { data_type => "text", is_nullable => 1 },
  "player",
  { data_type => "text", is_foreign_key => 1, is_nullable => 0 },
  "league",
  { data_type => "text", is_nullable => 0 },
  "course",
  { data_type => "text", is_nullable => 0 },
  "try",
  { data_type => "int", is_nullable => 1 },
  "score",
  { data_type => "int", is_nullable => 1 },
  "questionchance",
  { data_type => "int", is_nullable => 1 },
  "answerchance",
  { data_type => "int", is_nullable => 1 },
  "exercise",
  { data_type => "text", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("player", "league", "course", "question", "exercise");

=head1 RELATIONS

=head2 player

Type: belongs_to

Related object: L<Bett::Schema::Result::Member>

=cut

__PACKAGE__->belongs_to(
  "player",
  "Bett::Schema::Result::Member",
  { player => "player" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-14 06:56:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vmN12P01SjlxN1e9gJqrnw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
