package Bett::Schema::Result::Text;

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

Bett::Schema::Result::Text

=cut

__PACKAGE__->table("text");

=head1 ACCESSORS

=head2 id

  data_type: 'text
	description text'
  is_nullable: 0

=head2 genre

  data_type: 'text'
  is_nullable: 1

=head2 target

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "text\n\tdescription text", is_nullable => 0 },
  "genre",
  { data_type => "text", is_nullable => 1 },
  "target",
  { data_type => "text", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id", "target");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-08-05 14:10:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/A7W2vC6OLPsRngtldz8cQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
