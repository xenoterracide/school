#!/usr/bin/perl
# (c) caleb cushing 2008, license GPLv3
#
# note the proper way to write this would include a count of the elements in 
# the array and then use that number as a variable for the rand function
@saying=(
	"an apple a day keeps the docor away",
	"procrastination is a thief in time",
	"the early bird catches the worm",
	"handsome is is handsome does",
	"too many cooks spoil the broth"
);
print "$saying[rand(5)]\n";
