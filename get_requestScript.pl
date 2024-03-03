#!/usr/bin/perl -w

use strict;
use warnings;
require IO::Socket; ##what is this?

my $url = 'www.google.com';

my $socket = IO::Socket::INET->new(
  			Proto		=> 'tcp',
			PeerAddr	=> $url,
			PeerPort	=> 80) || die "[!] Cannot connect ...\n";

print "Connection to $url\n";
print $socket "GET $url HTTP/1.0\n\n";
$socket->recv(my $data, 1024); 
print "$data \n";
close ($socket);
