#!/usr/bin/perl
use warnings;
sub read_data {
	open (DATA, "data.txt") or die "can't open data.txt: $!\n";
	while (<DATA>) {
		@cd_db = ( @cd_db, [ split(/:/) ] );
	}
	close (DATA) or die "can't close data.txt: $!\n";
}
sub input {
	$input = <>;
}
sub prompt
{
	my $offset = 0;
	do {
		print "1:\tsearch\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($input = <>);
		if ( $input == 1) {
			&search;
		}
	} while ($input != 9);
}

sub search {
	do {
		print "Search\n";
		print "1:\tby Track\n";
		print "2:\tby Artist\n";
		print "3:\tby Album\n";
		print "4:\tby Year\n";
		print "8:\treturn to main\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($input = <>);
		if ($input == 8) {
			&prompt;
		} elsif ($input == 1) {
			print "Artist to search for: ";
			chomp($input = <>);
		}
	} while ($input != 9);
}

sub main {
	&read_data;
	&prompt;
}
&main;
