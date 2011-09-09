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
  "description",
  { data_type => "VARCHAR", is_nullable => 0, size => 50 },
  "type",
  { data_type => "VARCHAR", is_nullable => 0, size => 15 },
  "genre",
  {
    data_type => "INT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "id",
  {
    data_type => "SMALLINT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "target",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 15,
  },
  "content",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 500,
  },
  "answer",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 500,
  },
);
__PACKAGE__->set_primary_key("topic", "story", "id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-09-22 15:03:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:56gkl7nOCoZnA1omiRu98A

__PACKAGE__->has_many('played', 'CompComp::Schema::Result::Play', {
		'foreign.topic' => 'self.topic',
		'foreign.story' => 'self.story',
		'foreign.question' => 'self.id', } );

# You can replace this text with custom content, and it will be preserved on regeneration
1;
);
__PACKAGE__->set_primary_key("genre", "id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-08-26 18:19:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o0KPEBgCYRaRNsT0RCtavA

#
# Set relationships:
#

# has_many():
#   args:
#     1) Name of relationship, DBIC will create accessor with this name
#     2) Name of the model class referenced by this relationship
#     3) Column name in *foreign* table
__PACKAGE__->has_many(words => 'dic::Schema::Word',
        { 'foreign.genre' => 'self.genre', 'foreign.exercise' => 'self.id'});
__PACKAGE__->has_many(questions => 'dic::Schema::Question',
        { 'foreign.genre' => 'self.genre', 'foreign.text' => 'self.id', });
# __PACKAGE__->has_many(questionwords => 'dic::Schema::Questionword',
#	{ 'foreign.genre' => 'self.genre', 'foreign.text' => 'self.text'});


# many_to_many():
#   args:
#     1) Name of relationship, DBIC will create accessor with this name
#     2) Name of has_many() relationship this many_to_many() is shortcut for
#     3) Name of belongs_to() relationship in model class of has_many() above 
#   You must already have the has_many() defined to use a many_to_many().
# __PACKAGE__->many_to_many(questions => 'questions', 'questions');

__PACKAGE__->has_many( texts => 'dic::Schema::Text', { 'foreign.id'=>'self.text' });

# __PACKAGE__->belongs_to( text => 'dic::Schema::Text', { 'foreign.id'=>'self.text' });
# __PACKAGE__->belongs_to( leagueGenre => 'dic::Schema::Leaguegenre', { 'foreign.id'=>'self.genre' });

# You can replace this text with custom content, and it will be preserved on regeneration
1;
