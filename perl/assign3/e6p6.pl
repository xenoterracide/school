#!/usr/bin/perl

while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	if ( $name =~ /Ephram/ ) {
		$name = uc($name);
		print "$name\n";
	}
}
