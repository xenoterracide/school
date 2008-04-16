#!/usr/bin/perl

print "who are you searcing for? ";
$search=<STDIN>;
chomp($search);
print "search: $search\n";
while(my $line = <>) {
	@fields = split(":", $line);
	chomp (@fields);
	print "fields: @fields\n";
	print "search: $search\n";
	@results = grep( /$search/i, @fields);
	print "results: $results\n";
}
