#!perl

use strict;
use warnings;
use lib qw{lib /var/www/cgi-bin/bett/lib};
use FindBin '$Bin';

use Config::General;
use YAML qw/LoadFile/;
use Bett::Model::DB;
use Bett::Schema;

package Script;

use Moose;
with 'MooseX::Getopt';

has 'man'  => ( is => 'ro', isa => 'Bool' );
has 'help' => ( is => 'ro', isa => 'Bool' );
has 'story' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 's',);

package main;

my %config = Config::General->new( "bett.conf" )->getall;
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $story = $script->story;
my %characters = qx"$Bin/../bin/Characters_$story";
chomp %characters;
my %chars = reverse %characters;
chomp %chars;

my $class = $schema->resultset('Character');
$class->update_or_create({ exercise => $story,
		entity => $_, string => $chars{$_} }) for keys %chars;

=head1 NAME

script/characters.pl - populate character table from Model.hs

=head1 SYNOPSIS

perl script/characters.pl -a marriage -s clay

=head1 DESCRIPTION

INSERT INTO characters (exercise, string, entity) VALUES (?, ?)

Actually DELETE and INSERT. So it can be used to remove and add players.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
