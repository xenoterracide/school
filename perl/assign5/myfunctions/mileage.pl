#!/usr/bin/perl
sub check_var {
	my $number=$_;
	print $number;
	croak "Illegal value: $number" if $number != /\d+/ or $number < 0;
}
sub mileage (@)
{
	my $miles = @_[0];
	my $gas = @_[1];
	
	# calculate miles per gallon #
	my $mpg = ( $miles / $gas );

	# give user output
	print "\n";
	print "\tMiles:\t$miles\n";
	print "\tGas:\t$gas\n";
	print "\tMPG:\t$mpg\n";
	print "\n";
}
return 1;
