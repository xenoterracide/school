#!/usr/bin/perl
use warnings;
use strict;

sub prepend(@)
{
	my @list = @_;
	my $string = shift(@list);
	my $idx;
	my @array;

	for ($idx = 0; $idx <= $#list; $idx++) {
		push(@array, $string, $list[$idx]);
	}
	my $final = join(" ", @array);
	return $final;
}
print prepend("good", ("morning", "evening", "boy")), "\n";
