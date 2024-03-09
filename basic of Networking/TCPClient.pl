#!/usr/bin/perl -w

use strict;
use warnings;
require IO::Socket; ##what is this?
require IO::Socket::INET;

my $server = shift;
my $port = shift;
my $socket = IO::Socket::INET->new(
			PeerAddr		=> $server,
			PeerPort		=> $port,
			Proto			=> 'tcp') || die "[!] Cannot connect to $server";

print "Establishing connection to $server:$port\n";

while (<STDIN>)
{
	print $socket $_;
	print scalar <$socket>;
}
close $socket || die "[!] Cannot close connection...\n" 
