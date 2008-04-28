#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	print if $name =~ tr/Ephram/A-Z/;
}
