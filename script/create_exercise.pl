#!perl

use strict;
use warnings;
use lib '/home/drbean/bett/lib';
use FindBin '$Bin';
use Pod::Usage;

# use Config::General;
use YAML qw/LoadFile/;
use Bett::Model::DB;
use Bett::Schema;

package Script;

use Moose;
with 'MooseX::Getopt';

has 'man'  => ( is => 'ro', isa => 'Bool' );
has 'help' => ( is => 'ro', isa => 'Bool' );
has 'type' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 't',);
has 'genre' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 'g',);
has 'id' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 'i',);
has 'description' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 0,
    cmd_aliases => 'd',);

package main;

my $config = LoadFile 'bett.yaml';
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $type = $script->type;
my $genre = $script->genre;
my $id = $script->id;
my $description = $script->description;
my $man = $script->man;
my $help = $script->help;

pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

my $ex = { description => $description, genre => $genre,
	id => $id, type => $type };

my $class = $schema->resultset('Exercise')->update_or_create($ex);


=head1 NAME

create_exercise.pl - create exercise in bett DB from commandline

=head1 SYNOPSIS

perl script/create_exercise.pl -t Non-competitive -g business -i stress -d 'cusp and adventurers'

=head1 DESCRIPTION

INSERT INTO exercise (description, genre, id, type) VALUES (?, ?, ?, ?. ?)

Actually DELETE and INSERT. So it can be used to remove and add exercises. So be careful.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
