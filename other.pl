#!/usr/bin/perl
use strict;
use warnings;

my %count;
while (<>)
{
	if (/(\d+) (\d+) is eating/)
	{
		push @{$count{$2}}, $1;
	}
}

foreach my $philo (sort keys %count)
{
	print "philo $philo has eaten ", scalar @{$count{$philo}}, " times.\n";
}
