#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	@bday = split( /\//, $bday);
	if ( $name =~ /Lori/ ) {
		$age=(($bday[2]=
	}
}
