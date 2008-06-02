#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	$salary=($salary+250);
	print "$name $salary\n";
}
