#!/usr/bin/perl -w

use strict;
use warnings;
require IO::Socket; ##what is this?

my $url = 'www.atac.roma.it';
my $resource = '/'; #root of the website
my $socket = IO::Socket::INET->new(
  			Proto		=> 'tcp',
  						PeerAddr	=> $url,
  									PeerPort	=> 80) || die "[!] Cannot connect ...\n";

  									print "Connection to $url\n";
  									print $socket "GET $resource HTTP/1.0\n\n";
  									$socket->recv(my $data, 1024); 
  									print "$data \n";
  									close ($socket);
