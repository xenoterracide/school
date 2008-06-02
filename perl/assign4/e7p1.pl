#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	@address = split( "\ ", $address);
	if ( $name =~ /Norma/ ) {
		print "$address[3] $address[4]\n";
	}
}
