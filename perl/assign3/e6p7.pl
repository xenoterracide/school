#!/usr/bin/perl
use warnings;
while(my $line = <>) {
	if ( $line != m/4/ ) {
		print "$line\n";
	}
}
