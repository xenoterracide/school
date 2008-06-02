#!/usr/bin/perl
while(my $line = <>) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	if ($. >= 3  && $. <= 5 ) {
		print $name $salary;
	}
}
