#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	if ($bday =~ /^6/) {
		print "$name $bday\n";
	}
}
