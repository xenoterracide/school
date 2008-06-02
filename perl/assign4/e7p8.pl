#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	@address = split( "\ ", $address);
	if ($address[4] =~ s/CA/California/) {
		print "$address[4]\n";
	}
}
