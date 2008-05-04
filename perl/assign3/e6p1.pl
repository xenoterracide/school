#!/usr/bin/perl

while(my $line = <>) {
	print $line if $line =~ /Street/;
}
