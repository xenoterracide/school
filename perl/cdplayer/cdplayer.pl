#!/usr/bin/perl
use warnings;
use diagnostics;
use strict;
my @cd_db;

# read data.txt
sub read_data {
	open (DATA, "data.txt") or die "can't open data.txt: $!\n";
	while (<DATA>) {
		@cd_db = ( @cd_db, [ split(/:/) ] );
	}
	close (DATA) or die "can't close data.txt: $!\n";
}

# initial menu
sub prompt
{
	my $input;
	my $offset = 0;
	do {
		print "1:\tsearch\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($input = <>);
		if ( $input == 1) {
			search();
		}
	} while ($input != 9);
}

# search data.txt
sub search {
	my $input;
	do {
		print "Search\n";
		print "1:\tby Track\n";
		print "2:\tby Artist\n";
		print "3:\tby Album\n";
		print "4:\tby Year\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($input = <>);
		if ($input == 1) {
			print "Track to search for: ";
			chomp($input = <>);
			print "$input\n";
			for (my $idx = 0; $idx<=100; $idx++) {
				if ($cd_db[$idx][0] = m/$input/g) {
					print "$cd_db[$idx][0]\n";
				}
			}
		}
	} while ($input != 9);
}

sub main {
	read_data();
	prompt();
}
main();
