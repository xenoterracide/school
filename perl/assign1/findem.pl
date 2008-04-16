#!/usr/bin/perl
use warnings;
print "who are you searcing for? ";
chomp($search=<STDIN>);
print "search: $search\n";
while(my $line = <>) {
	@fields = split(":", $line);
	chomp (@fields);
	print "fields: @fields\n";
	print "search: $search\n";
	@results = grep( /$search/i, @fields);
	print "results: @results\n";
}
