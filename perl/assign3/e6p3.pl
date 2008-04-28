#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	($fname, $lname) = split(" ", $name);
	print $line if $lname =~ /Ker/;
}
