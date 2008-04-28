#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	print "$name $addres\n" if $name =~ /Lori Gortz/;
}
