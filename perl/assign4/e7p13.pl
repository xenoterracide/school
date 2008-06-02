#!/usr/bin/perl
while(chomp(my $line = <>)) {
	($name, $phone, $address, $bday, $salary) = split(":", $line);
	@name = split( "\ ", $name);
	print "$name[1], $name[0]:$phone:$address:$bday:$salary\n";
}
