#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	@bday = split( /\//, $bday);
	if ( $bday[0] =~ /3/ ) {
		print "$name\n";
	}
}
