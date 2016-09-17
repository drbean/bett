package Bett::Schema::Result::S;

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

Bett::Schema::Result::S

=cut

__PACKAGE__->table("s");

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

=head2 score

  data_type: 'int'
  is_nullable: 1

=head2 questionchance

  data_type: 'int'
  is_nullable: 1

=head2 answerchance

  data_type: 'int'
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
  "score",
  { data_type => "int", is_nullable => 1 },
  "questionchance",
  { data_type => "int", is_nullable => 1 },
  "answerchance",
  { data_type => "int", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("player", "league", "exercise");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-14 12:32:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VSgLVZEEnmpH0N48Xrgegg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
