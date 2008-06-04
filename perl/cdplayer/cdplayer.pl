#!/usr/bin/perl
use warnings; #remove for release
use strict;
my @cd_db;
my @fav;

# READ DATA - cc
sub read_data {
	open (DATA, "data.txt")
		or die "can't open data.txt: $!\n";
	while (<DATA>) {
		@cd_db = ( @cd_db, [ split(/:/) ] );
		# collection format
		# $cd_db[$idx][0] = $track
		# $cd_db[$idx][1] = $artist
		# $cd_db[$idx][2] = $album
		# $cd_db[$idx][3] = $year
	}
	close (DATA) or die "can't close data.txt: $!\n";
}

# READ FAVORITES - cc
sub read_fav
{
	my $line;
	open (FAV, "favorites.txt")
		or die "can't open favorites.txt: $!\n";
	while (chomp($line = <FAV>)) {
		push(@fav, $line)
	}
	close (FAV) or die "can't close data.txt: $!\n";
}

# ZERO_DATA - empty data.txt before writing - cc
sub zero_data ($)
{
	my $data = $_;
	open (DATA, ">$data") or die "can't open data.txt for writing: $!\n";
	print DATA "";
	close (DATA) or die "can't close data.txt: $!\n";
}
# PROMPT - initiam menu - cc
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

# SEARCH for CD's - cc
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

# MODIFY MENU - cc
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

# ADD_CD - cc
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


# REMOVE_CD - cc
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

	zero_data("data.txt");

	open (DATA, ">>data.txt") or
		die "can't open data.txt for writing: $!\n";
	for (my $idx=0; $idx<=$#cd_db; $idx++) {
		print DATA join(":",
			$cd_db[$idx][0],
			$cd_db[$idx][1],
			$cd_db[$idx][2],
			$cd_db[$idx][3]), "";
	}
	print DATA "\n";
	close (DATA) or die "can't close data.txt: $!\n";
}

# FAVORITES MENU - cc
sub favorites
{
	my $menu_input;
	do {
		print "1:\tshow favorites\n";
		print "2:\tadd favorite\n";
		print "3:\tremove favorite\n";
		print "9:\texit\n";
		print "Enter an option: ";

		chomp($menu_input = <>);

		if      ($menu_input == 1) {
			fav_show();
		} elsif ($menu_input == 2) {
			fav_add();
		} elsif ($menu_input == 3) {
			fav_del();
		}
	}     while ($menu_input != 9);
}

# SHOW FAVORITES - cc
sub fav_show {
	print "debug: @fav\n";
	for(my $idx=0; $idx <= $#fav; $idx++) {
		print "$fav[$idx]\n";
	}
}

# ADD FAVORITE - cc
sub fav_add {
	my $previous;
	my $cd_num;
	my $favToAdd;

	print "\n";
	for (my $idx=0; $idx<=$#cd_db; $idx++) {
		if ($previous ne $cd_db[$idx][2]) {
			print "\t$idx\t$cd_db[$idx][2]\n";
		}
		$previous = $cd_db[$idx][2];
	}
	print "Add Fav #: ";

	chomp($cd_num = <>); # get the required array number
	$favToAdd = $cd_db[$cd_num][2];	# use the array number to look up the
										# name
	open (FAV, ">>favorites.txt")
		or die "can't open favorites.txt for writing: $!\n";
	print FAV "$favToAdd\n";
	close (FAV) or die "can't close data.txt: $!\n";
}

# DELETE FAVORITE - cc
sub fav_del
{
	my @fav;
	open (FAV, "favorites.txt")
		or die "can't open favorites.txt for writing: $!\n";
	while (<FAV>) {
		chomp(@fav = <FAV>);
	}
		print "@fav\n";
	close (FAV) or die "can't close data.txt: $!\n";
}

# MAIN function -cc
# serves same purpose of C function of same name
sub main
{
	read_data();
	read_fav();
	prompt();
}
main();
