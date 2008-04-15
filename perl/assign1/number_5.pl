#!/usr/bin/perl
@names=qw(Nick Susan Chet Dolly Bill);
print "@names\n";
splice(@names, 1, 2, ellie, beatrice, charles);
print "@names\n";
splice(@names, 5);
print "@names\n";
