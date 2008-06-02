#!/usr/bin/perl
while(chomp (my $line = <>)) {
	if ($line != /Karen/) {
		print "$line\n";
	}
}
