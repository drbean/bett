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
  is_nullable: 1

=head2 lexed

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

=head2 grammatical

  data_type: 'bool'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "player",
  { data_type => "text", is_nullable => 1 },
  "lexed",
  { data_type => "text", is_nullable => 0 },
  "league",
  { data_type => "text", is_nullable => 0 },
  "exercise",
  { data_type => "text", is_nullable => 0 },
  "course",
  { data_type => "text", is_nullable => 1 },
  "quoted",
  { data_type => "text", is_nullable => 1 },
  "grammatical",
  { data_type => "bool", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("lexed", "exercise", "league");

=head1 RELATIONS

=head2 played_by

Type: belongs_to

Related object: L<Bett::Schema::Result::Member>

=cut

__PACKAGE__->belongs_to(
  "played_by",
  "Bett::Schema::Result::Member",
  {	"foreign.player" => "self.player",
  	"foreign.league" => "self.league"
  },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


=head2 wh

Type: belongs_to

Related object: L<Bett::Schema::Result::Wh>

=cut

#__PACKAGE__->belongs_to(
#  "whs",
#  "Bett::Schema::Result::Wh",
#  {	"foreign.player" => "self.player",
#  	"foreign.league" => "self.league",
#        "foreign.exercise" => "self.exercise"
#  },
#  {
#    is_deferrable => 1,
#    join_type     => "LEFT",
#    on_delete     => "CASCADE",
#    on_update     => "CASCADE",
#  },
#);


#=head2 yn
#
#Type: belongs_to
#
#Related object: L<Bett::Schema::Result::Yn>
#
#=cut
#
#__PACKAGE__->belongs_to(
#  "yns",
#  "Bett::Schema::Result::Yn",
#  {	"foreign.player" => "self.player",
#  	"foreign.league" => "self.league",
#	"foreign.exercise" => "self.exercise"
#  },
#  {
#    is_deferrable => 1,
#    join_type     => "LEFT",
#    on_delete     => "CASCADE",
#    on_update     => "CASCADE",
#  },
#);


#=head2 s
#
#Type: belongs_to
#
#Related object: L<Bett::Schema::Result::S>
#
#=cut
#
#__PACKAGE__->belongs_to(
#  "s",
#  "Bett::Schema::Result::S",
#  {	"foreign.player" => "self.player",
#  	"foreign.league" => "self.league",
#	"foreign.exercise" => "self.exercise"
#  },
#  {
#    is_deferrable => 1,
#    join_type     => "LEFT",
#    on_delete     => "CASCADE",
#    on_update     => "CASCADE",
#  },
#);
#
#
#=head2 of_league
#
#Type: belongs_to
#
#Related object: L<Bett::Schema::Result::League>
#
#=cut
#
#__PACKAGE__->belongs_to(
#  "of_league",
#  "Bett::Schema::Result::League",
#  "league",
#  {
#    is_deferrable => 1,
#    join_type     => "LEFT",
#    on_delete     => "CASCADE",
#    on_update     => "CASCADE",
#  },
#);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-14 12:32:21
# Modified by Dr Bean

# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ldr3SQuAFHsZisfdFLo2Rw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
