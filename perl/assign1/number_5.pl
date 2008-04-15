#!/usr/bin/perl
# (C) Caleb Cushing 2008, License GPLv3
# all print statements are for debugging they aren't required
# the original assignment asks for one statement if that's true this may be 
# marked down, but one statement would make it messier
@names=qw(Nick Susan Chet Dolly Bill);
print  "@names\n";
splice (@names, 1, 2, ellie, beatrice, charles);
print  "@names\n";
splice (@names, 5);
print  "@names\n";
push   (@names, "lewis", "izzy");
print  "@names\n";
shift   @names; #seems like a hack but splice didn't work
print  "@names\n";
@names=reverse(@names);
print  "@names\n";
unshift(@names, "archie");
print  "@names\n";
@names=sort(@names);
print  "@names\n";
