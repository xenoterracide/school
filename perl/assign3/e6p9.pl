#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	print $bday if $name =~ /Tommy\ Savage/;
}
