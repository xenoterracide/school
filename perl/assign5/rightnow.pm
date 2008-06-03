#!/usr/bin/perl

package rightNow;

sub new {
	my $class = shift;
	my $ref={
		second=>$sec,
		minute=>$min,
		hour=>$hour,
		mday=>$mday,
		month=>$mon,
		year=>$year,
		wday=>$wday,
		yday=>$yday,
		isdst=>$isdst,
};

bless($ref, rightNow);

sub set_time {
	my $self = shift;
}
sub print_time {
	my $self = shift;
	print $self->
