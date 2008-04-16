#!/usr/bin/perl
#(c) Caleb Cushing, 2008, License GPLv3
print "who are you searcing for? ";
chomp($search=<STDIN>);
print "search: $search\n";
while(my $line = <>) {
	($name, $phone, $salary) = split(":", $line);
	$count   = grep( /$search/i, $name);
	while ($count != 0) {
		@results = grep( /$search/i, $name);
		print "results: @results\nphone: $phone\n";
		print "new phone number? ";
		chomp($newphone=<STDIN>);
		$phone=$newphone;
		print "@results new phone number is $phone\n";
		$count = 0
	}
}
