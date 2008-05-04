#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	if ($name =~ /Lori Gortz/) {
		print "$name $address\n";
	};
}
