#!/usr/bin/perl
use warnings; #remove for release
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
	do {
		print "1:\tsearch\n";
		print "2:\tmodify cd's\n";
		print "3:\tfavorites\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($menu_input = <>);
		if ( $menu_input == 1) {
			search();
		} elsif ( $menu_input == 2 ) {
			modify();
		} elsif ( $menu_input == 3 ) {
			favorites();
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
			for (my $idx = 0; $idx<=$#cd_db; $idx++) {
				if ($cd_db[$idx][0] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
				else {
					print "not found\n";
				}
			}
		} elsif ($menu_input == 2) { # artist
			print "Artist to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=$#cd_db; $idx++) {
				if ($cd_db[$idx][1] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
				else {
					print "not found\n";
				}
			}
		} elsif ($menu_input == 3) { #album
			print "Album to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=$#cd_db; $idx++) {
				if ($cd_db[$idx][2] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
				else {
					print "not found\n";
				}
			}
		} elsif ($menu_input == 4) { #year
			print "Year to search for: ";
			chomp($search_input = <>);
			print "\n"; # filler blank line
			for (my $idx = 0; $idx<=$#cd_db; $idx++) {
				if ($cd_db[$idx][3] =~ m/$search_input/gi) {
					print "\tTrack:\t$cd_db[$idx][0]\n";
					print "\tArtist:\t$cd_db[$idx][1]\n";
					print "\tAlbum:\t$cd_db[$idx][2]\n";
					print "\tYear:\t$cd_db[$idx][3]\n";
				}
				else {
					print "not found\n";
				}
			}
		}
	} while ($menu_input != 9);
}
# modify menu
sub modify
{
	my $menu_input;
	do {
		print "1:\tadd cd\n";
		print "2:\tremove cd\n";
		print "9:\texit\n";
		print "Enter an option: ";
		chomp($menu_input = <>);
		if ( $menu_input == 1) {
			add_cd();
		} elsif ( $menu_input == 2 ) {
			remove_cd();
		}
	} while ($menu_input != 9);
}

sub display_cds {
}

sub add_cd {
	my $tmp;
	my @cd_data;
	my $newline;

	print "\n";
	print "Enter CD DATA\n";

	print "Track: ";
	chomp($tmp = <>);
	push(@cd_data, $tmp);

	print "Artist: ";
	chomp($tmp = <>);
	push(@cd_data, $tmp);

	print "Album: ";
	chomp($tmp = <>);
	push(@cd_data, $tmp);

	print "Year: ";
	chomp($tmp = <>);
	push(@cd_data, $tmp);

	push(@cd_db, [ @cd_data ]);
	$newline=join(':', @cd_data);
	open (DATA, ">>data.txt") or die "can't open data.txt for writing: $!\n";
	print DATA "$newline\n";
	close (DATA) or die "can't close data.txt: $!\n";
}

# should actually be named remove track.
sub remove_cd {
	my $previous = "\n";
	my $cd_num;
	my $cdToRemove;

	print "\n";
	for (my $idx=0; $idx<=$#cd_db; $idx++) {
		if ($previous ne $cd_db[$idx][2]) {
			print "\t$idx\t$cd_db[$idx][2]\n";
		}
		$previous = $cd_db[$idx][2];
	}
	print "Remove CD #: ";

	chomp($cd_num = <>); # get the required array number
	$cdToRemove = $cd_db[$cd_num][2];	# use the array number to look up the
										# name

	for (my $idx=0; $idx<=$#cd_db; $idx++) {
		# compare the name to the array run it through a while loop to remove 
		# all enteries
		while ($cdToRemove eq $cd_db[$idx][2]) {
			splice(@cd_db, $idx, 1) or die "debug: unable to splice";
		}
	};
	print "\n";
}

sub favorites {
}

sub main {
	read_data();
	prompt();
}
main();
