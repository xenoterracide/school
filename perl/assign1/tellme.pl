#!/usr/bin/perl

while(my $line = <>) {
	($name,$phone,$salary)=split(":",$line);
	print "Name:\t$name\nPhone:\t$phone\nSalary:\t$salary";
}
