#!/usr/bin/perl
while(chomp (my $line = <>)) {
	if ($line == /\d{5,5}$/) {
		print "$line\n";
	}
}
