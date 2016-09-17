#!perl

use strict;
use warnings;
use lib ( "lib", "/var/www/cgi-bin/bett/lib" );
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

my $config = LoadFile "/var/www/cgi-bin/bett/bett.yaml";
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $script = Script->new_with_options;
my $story = $script->story;
my $sentences = qx"$Bin/../bin/Sentences_$story";
chomp $sentences;

my $sentencestring = { exercise => $story, string =>  $sentences };

my $class = $schema->resultset('Sentence')->update_or_create($sentencestring);

=head1 NAME

script/sentences.pl - populate sentence table from Parsing.hs

=head1 SYNOPSIS

perl script/sentences.pl -s clay

=head1 DESCRIPTION

INSERT INTO sentence (exercise, string) VALUES (?, ?)

Actually DELETE and INSERT. So it can be used to remove sentences.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
