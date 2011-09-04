#!perl

use strict;
use warnings;
use lib 'lib';

use Config::General;
use Cwd;
use File::Spec;
use Grades;
use YAML qw/LoadFile/;

use Bett::Model::DB;
use Bett::Schema;

my %config = Config::General->new( "bett.conf" )->getall;
my $connect_info = Bett::Model::DB->config->{connect_info};
my $schema = Bett::Schema->connect( $connect_info );

my $ex = Grades::Script->new_with_options->exercise;
my %characters = qx"../class/conversation/marriage/$ex/Characters";
chomp %characters;
my %chars = reverse %characters;
chomp %chars;

my $chars = [ [ qw/exercise entity string/ ] ];
push @$chars, [ $ex, $_, $chars{$_} ] for keys %chars;
uptodatepopulate( 'Character', $chars );

sub uptodatepopulate
{
	my $class = $schema->resultset(shift);
	my $entries = shift;
	my $columns = shift @$entries;
	foreach my $row ( @$entries )
	{
		my %hash;
		@hash{@$columns} = @$row;
		$class->update_or_create(\%hash);
	}
}


=head1 NAME

script/characters.pl - populate character table from Model.hs

=head1 SYNOPSIS

perl script/characters.pl -x clay

=head1 DESCRIPTION

INSERT INTO characters (exercise, string, entity) VALUES (?, ?)

Actually UPDATE or INSERT. So it can be used when new players are added.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
