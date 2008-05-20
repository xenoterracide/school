#!/usr/bin/perl
use warnings;

# prompt user
sub prompt
{
	my $offset;
	print "Enter an offset: ";
	GET_OFFSET:
	while (<>) {
		chomp;
		if (m/\\A [+-] \\d+ \\z/x) {
			$offset = $_;
			last GET_OFFSET;
		}
	}
	print "Enter an offset (please enter an integer): ";
}

sub sortcd {
	print "Enter Aritist Name, Issue Year, or CD Title to sort by:\n";
	chomp ($entry = <STDIN>);
	# not sure if the bleow is needed
	# while (<FILE>) {
	# ($artist, $year, $title)=split(":");
	foreach (@cddata) {
		($artist,$year, $title) = split(":");
# artitst
		if ($entry = $artist) {
			@cddata = <>;
			@sortedlist = sort @cddata; # sort based on first entry
			print @sortedlist;
		}
# year
		elsif ($entry = $year) {
			$year{$_} = $year; # record it
			print sort {$year{$a} <=> $year{$b}};
		}
# title
		elsif ($entry = $title) { #match
			$title{$_} = $title; # record it
			print sort {$year{$a} <=> $year{$b}};
		}
#illegal
		else {
			print "Illegal Choice.\n";
		}
	}; #match
}

# Search Artist - Search an artist and display CD information if found. If not found display "not found"

sub searchcd
{
	open (File, "data.txt") or die "Can't open CD List: $!\n";

	print "Enter Aritist Name to search for: \n";
	chomp ($entry = <STDIN>);

	while (<FILE>) {
		($artist, $year, $title)=split(":");

		if ($entry = $artist) {
			print "$artist\t $year\t$title\n";
		}
		else {
			print "Artist not found. \n"
		};
	};

	close(FILE);
};

# Random CD - Randomly select a CD from the file

sub randomcd
{
	srand;
	open(File, "cdlist") or die "Can't open CD List: $!\n";

	rand($.) <1 && ($line=$_) while <>;
	print $line "\n";

	close(FILE);
};

# Add CD info - Add a CD to collection list

sub addcd
{
	open(HANDLE, ">>cdlist") || die "Can't open CD List: $!\n";

	print "Enter CD information in the following format Artist:IssueYear:CD Title \n";
	chomp $cdinfo=<STDIN>;

	print HANDLE $cdinfo;
};

sub read_data
{
	open (DATA, "data.txt") or die "can't open data: $!\n";
	while (<DATA>) {
		($track, $artist, $album, $year) = split(":");
	}
	close (DATA);
}

sub main
{
	&prompt;
}

&main;
