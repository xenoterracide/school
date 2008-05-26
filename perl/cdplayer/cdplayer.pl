#!/usr/bin/perl
#use warnings; #remove for release
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
		print "2:\tmodify cd's\n";
		print "3:\tfavorites\n";
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

	do { # while != 9 (9 is exit option)
	
		# display menu
		print "Search\n";
		print "1:\tby Track\n";
		print "2:\tby Artist\n";
		print "3:\tby Album\n";
		print "4:\tby Year\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($menu_input = <>);

		# parse menu
		if ($menu_input == 1) { # track
			print "Track to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=100; $idx++) {
				if ($cd_db[$idx][0] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
			}
		} elsif ($menu_input == 2) { # artist
			print "Artist to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=100; $idx++) {
				if ($cd_db[$idx][1] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
			}
		} elsif ($menu_input == 3) { #album
			print "Album to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=100; $idx++) {
				if ($cd_db[$idx][2] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
			}
		} elsif ($menu_input == 4) { #year
			print "Year to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=100; $idx++) {
				if ($cd_db[$idx][3] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
			}
		}
	} while ($menu_input != 9);
}

sub main {
	read_data();
	prompt();
}
main();
