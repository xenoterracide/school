#!/usr/bin/perl
use warnings;
use strict;
use Carp qw(croak);
require "myfunctions/mileage.pl";

# variables
my $miles;
my $gas;

# get user data
print "Enter Miles traveled: ";
chomp($miles = <>);
check_var($miles);
print "Enter Gas used: ";
chomp($gas = <>);
check_var($gas);

mileage($miles, $gas);
