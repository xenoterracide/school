#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	if ( $name =~ s/William/Siegfried/) {
		print "$name\n";
	}
}
