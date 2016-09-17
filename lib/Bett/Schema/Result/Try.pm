package Bett::Schema::Result::Try;

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

Bett::Schema::Result::Try

=cut

__PACKAGE__->table("try");

=head1 ACCESSORS

=head2 exercise

  data_type: 'text'
  is_nullable: 0

=head2 player

  data_type: 'text'
  is_nullable: 0

=head2 league

  data_type: 'text'
  is_nullable: 0

=head2 try

  data_type: 'int'
  is_nullable: 1

=head2 quoted

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "exercise",
  { data_type => "text", is_nullable => 0 },
  "player",
  { data_type => "text", is_nullable => 0 },
  "league",
  { data_type => "text", is_nullable => 0 },
  "try",
  { data_type => "int", is_nullable => 1 },
  "quoted",
  { data_type => "text", is_nullable => 1 },
  "answer",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("player", "league", "exercise", "try");

=head1 RELATIONS

=head2 questions

Type: has_many

Related object: L<Bett::Schema::Result::Question>

=cut

__PACKAGE__->has_many(
  "questions",
  "Bett::Schema::Result::Question",
  {	"foreign.player" => "self.player",
  	"foreign.league" => "self.league",
	"foreign.exercise" => "self.exercise"
  },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-14 12:32:21
# Modified by DrBean

# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f9kepwCYBOuD4mbTqqJRmQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
