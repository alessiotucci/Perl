#!/usr/bin/perl -w
use strict;
use warnings;
use Socket; ## bingAi told me to put little guy here
require IO::Socket; ##what is this?
require IO::Socket::INET;

my $port = shift || die "[!] No port given ... \n";;
my $socket = IO::Socket::INET->new(
			LocalPort		=> $port,
			Proto			=> 'tcp',
			Listen			=> SOMAXCONN ) || die "[!] CAnnot establish Socket ...\n";

print "Listening for connections on $port\n";
## I forgot the semicolon over here
while (my $client = $socket->accept)
{
	my $addr = gethostbyaddr($client->peeraddr, AF_INET);
	my $port = $client->peerport;
	while (<$client>)
	{
		print "[Client:$port] $_";
		print $client "$.: $_";
	}
	close $client || die "[!] Connection Unable to close ...\n";
	die "[!] Cannot connect $!\n";
}

