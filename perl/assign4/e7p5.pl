#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	if ($phone =~ /408/) {
		print "$name $phone\n";
	}
}
