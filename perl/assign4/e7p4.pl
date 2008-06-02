#!/usr/bin/perl
while(my $line = <>) {
	if ($. >= 2 && $. <= 6 ) {
		print $line;
	}
}
