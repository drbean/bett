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
my $words = qx"../class/conversation/marriage/$ex/Words";
chomp $words;

my @words = ( [ qw/exercise string/ ] );
push @words, [ $ex, $words ];
uptodatepopulate( 'Word', \@words );

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

script/words.pl - populate word table from Parsing.hs

=head1 SYNOPSIS

perl script/words.pl -x clay

=head1 DESCRIPTION

INSERT INTO word (exercise, string) VALUES (?, ?)

Actually UPDATE or INSERT. So it can be used to change words.

=head1 AUTHOR

Dr Bean, C<drbean at (@) cpan dot, yes a dot, org>

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
