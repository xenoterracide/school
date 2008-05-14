#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	@address = split( "\ ", $address);
	if ( $address =~ /MA/ ) {
		print "@address[5]\n";
	}
}
