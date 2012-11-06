#!perl

use strict;
use warnings;
use lib 'lib';
use FindBin '$Bin';
use Pod::Usage;

use Config::General;
use YAML qw/LoadFile/;
use Bett::Model::DB;
use Bett::Schema;

package Script;

use Moose;
with 'MooseX::Getopt';

has 'man'  => ( is => 'ro', isa => 'Bool' );
has 'help' => ( is => 'ro', isa => 'Bool' );
has 'id' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 1,
    cmd_aliases => 'i',);
has 'genre' => (
    traits => ['Getopt'], is => 'ro', isa => 'Str', required => 1,
    cmd_aliases => 'g',);

package main;

my %config = Config::General->new( "bett.conf" )->getall;
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $genre = $script->genre;
my $id = $script->id;
my $man = $script->man;
my $help = $script->help;

pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

my $class = $schema->resultset('Exercise')->find(
	{ genre => $genre, id => $id})->delete;


=head1 NAME

delete_exercise.pl - delete exercise in bett DB from commandline

=head1 SYNOPSIS

perl script/delete_exercise.pl -i careers -g business

=head1 DESCRIPTION

DELETE FROM exercise where id='careers' and genre='business';

It is used to remove exercises. So be careful.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
