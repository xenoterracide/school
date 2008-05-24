#!/usr/bin/perl
use warnings;
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
	my $menu_input;
	my $offset = 0;
	do {
		print "1:\tsearch\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($menu_input = <>);
		if ( $menu_input == 1) {
			search();
		}
	} while ($menu_input != 9);
}

# search data.txt
sub search {
	my $menu_input; # navigate menu
	my $search_input; #var for regex
	do {
		print "Search\n";
		print "1:\tby Track\n";
		print "2:\tby Artist\n";
		print "3:\tby Album\n";
		print "4:\tby Year\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($menu_input = <>);
		if ($menu_input == 1) {
			print "Track to search for: ";
			chomp($search_input = <>);
			print "$search_input 1\n"; #debug
			for (my $idx = 0; $idx<=100; $idx++) {
				print "$search_input 2\n"; #debug
				if ($cd_db[$idx][0] =~ m/$search_input/gi) {
					print "$search_input 3\n"; #debug
					print "\n\t$cd_db[$idx][0]\n\n";
				}
				print "$search_input 4\n"; #debug
			}
			print "$search_input 5\n"; #debug
		}
	} while ($menu_input != 9);
}

sub main {
	read_data();
	prompt();
}
main();
