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
		print "1:\tmodify collection\n";
		print "4:\texit\n";
		print "Enter an offset: ";
		$input = <>;
		chomp($input);
		if ( $input == 1) {
			&mod_db;
		}
	}
	while ($input != 4);
}

sub mod_db {
	print "mod_db placeholder\n";
}

sub main {
	&read_data;
	&prompt;
}
&main;
