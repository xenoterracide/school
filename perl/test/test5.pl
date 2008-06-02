#!/usr/bin/perl
use warnings;
use strict;

open(FH1,  "data1.txt") or die "can't open data1.txt: $!\n";
open(FH2, ">data2.txt") or die "can't open data2.txt: $!\n";
while(<FH1>) {
	my $line;
	my @data;
	chomp($line=<FH1>);
	@data=split(/:/, $line);
	if ($data[1] > 50000) {
		print FH2 $line, "\n";
	}
}
close(FH1);
close(FH2);
