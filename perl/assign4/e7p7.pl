#!/usr/bin/perl
while(my $line = <>) {
	if ($. == 3) {
		print "$line\n";
		for ($i = 0; $i < 80; $i++) {
			print "*";
		}
		print "\n"
	}
}
