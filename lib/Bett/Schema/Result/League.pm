package Bett::Schema::Result::League;

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

Bett::Schema::Result::League

=cut

__PACKAGE__->table("league");

=head1 ACCESSORS

=head2 id

  data_type: 'text'
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 field

  data_type: 'text'
  is_nullable: 1

=head2 genre

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "text", is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "field",
  { data_type => "text", is_nullable => 1 },
  "genre",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 members

Type: has_many

Related object: L<Bett::Schema::Result::Member>

=cut

__PACKAGE__->has_many(
  "members",
  "Bett::Schema::Result::Member",
  { "foreign.league" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 leaguegenres

Type: has_many

Related object: L<Bett::Schema::Result::Leaguegenre>

=cut

__PACKAGE__->has_many(
  "leaguegenres",
  "Bett::Schema::Result::Leaguegenre",
  { "foreign.league" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-05 14:10:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BjDYLyoLAt9q8bs7fHS7nA

=head2 players

Type: many_many

Related object: L<Bett::Schema::Result::Player>

=cut

__PACKAGE__->many_to_many( "players" => 'members', 'player' );
  
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
