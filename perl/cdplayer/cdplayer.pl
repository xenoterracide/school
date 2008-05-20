#!/usr/bin/perl
use warnings;
# prompt user
sub prompt
{
	my $offset;
	print "Enter an offset: ";
	GET_OFFSET:
	while (<>)
	{
    	chomp;
    	if (m/\\A [+-] \\d+ \\z/x) {
			$offset = $_;
        	last GET_OFFSET;
		}
		print "Enter an offset (please enter an integer): ";
}

sub sortcd
{
	print "Enter Aritist Name, Issue Year, or CD Title to sort by: \n";
	chomp ($entry = <STDIN>);

	while (<FILE>) {
	($artist, $year, $title)=split(":");

	if($entry = $artist){
		open(FOO, "| sort +1| tr  '[a-z]'  '[A-Z]' ");
		open(FILE, "cdlist");
		while (<FILE>)
			{print FOO;}
		close FOO;
	elsif($entry = $year){ 
		sub byyear {$year{$a} <=> $year{$b};      
		open(FOO, "| sort byyear|");
		open(FILE, "cdlist");
		while (<FILE>)
			{print FOO;}
		close FOO;
	elsif($entry = $title){
		open(FOO, "| sort +1| tr  '[a-z]'  '[A-Z]' ");
		open(FILE, "cdlist");
		while (<FILE>)
			{print FOO;}
		close FOO;
	else{print "Illegal Choice\n"};
	};
};


# Search Artist - Search an artist and display CD information if found. If not found display "not found"

sub searchcd
{
	open(File, "cdlist" || die "Can't open CD List: $!\n";

	print "Enter Aritist Name to search for: \n";
	chomp ($entry = <STDIN>);

	while (<FILE>) {
	($artist, $year, $title)=split(":");

	if($entry = $artist){
		print $artist \t $year \t title "\n";}
	else{print "Artist not found. \n"};
	};

	close(FILE);
};

# Random CD - Randomly select a CD from the file

sub randomcd{
	srand;
	open(File, "cdlist" || die "Can't open CD List: $!\n";

	rand($.) <1 && ($line=$_) while <>;
	print $line "\n";

	close(FILE);
};

# Add CD info - Add a CD to collection list

sub addcd {
	open(HANDLE, ">>cdlist") || die "Can't open CD List: $!\n";

	print "Enter CD information in the following format Artist:IssueYear:CD Title \n";
	chomp $cdinfo=<STDIN>;

	print HANDLE $cdinfo;
};

sub main {
	&prompt;
}

&main;
