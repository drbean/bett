#!perl

use strict;
use warnings;
use lib 'lib';
use FindBin '$Bin';
use Pod::Usage;

use Config::General;
use YAML qw/LoadFile Dump/;
use Bett::Model::DB;
use Bett::Schema;

package Script;

use Moose;
with 'MooseX::Getopt';

has 'man'  => ( is => 'ro', isa => 'Bool' );
has 'help' => ( is => 'ro', isa => 'Bool' );

package main;

my %config = Config::General->new( "bett.conf" )->getall;
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $man = $script->man;
my $help = $script->help;

pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

my $class = $schema->resultset('Exercise')->search;

my @exs;

while (my $ex = $class->next ) {
	push @exs, { type => $ex->type, genre => $ex->genre, id => $ex->id,
		description => $ex->description }
}

print Dump \@exs;


=head1 NAME

list_exercise.pl - select * from exercise in bett DB from commandline

=head1 SYNOPSIS

perl script/list_exercise.pl

=head1 DESCRIPTION

SELECT * FROM exercise;

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
