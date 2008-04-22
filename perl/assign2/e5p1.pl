#!/usr/bin/perl
#(c) Caleb Cushing 2008, License GPLv3
$absolute_zero = -459.67; #define absolute zero constant
$state=0; #errors are negative

while ($state != 1) {
	#get input
	print "enter fahrenheit range: ";
	chomp($input = <STDIN>);
	($begin, $end)=split(':',$input);

	# error checking
	if ($begin > $end || $begin < $absolute_zero) {
		if ($begin > $end) {
			$state=-2;
			print STDERR "error: $state enter a valid range.\n";
			print STDERR "error: example: 32:48\n";
		} else {
			$state=-1;
			print STDERR "error: $state enter a valid temperatures\n";
		}
	} else {
		$state=1;
	}
}
print "Fahrenheit\tCelcius\n";
while ($begin <= $end) {
	$celsius=(($begin - 32) / 1.8);
	printf "%.2f\t\t\%.2f\n",$begin, $celsius;
	$begin++;
}
