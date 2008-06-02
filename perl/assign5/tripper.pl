#!/usr/bin/perl
use warnings;
use strict;

sub mileage
{
	# variables
	my $gas;
	my $miles;
	my $mpg;
	
	# get user data
	print "Enter Miles traveled: ";
	chomp($miles = <>);
	print "Enter Gas used: ";
	chomp($gas = <>);

	# calculate miles per gallon #
	$mpg = ( $miles / $gas );

	# give user output
	print "\n";
	print "\tMiles:\t$miles\n";
	print "\tGas:\t$gas\n";
	print "\tMPG:\t$mpg\n";
	print "\n";
}
mileage();
