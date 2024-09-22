#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
use HTML::TreeBuilder 5 -weak;  # Ensure weak references are used

my $url = 'http://www.atac.roma.it';
# prolly need  to add those
my $ua = LWP::UserAgent->new;
$ua->timeout(10);
$ua->agent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36');

$ua->max_redirect(7); # Set redirect limit
#my $response = $ua->get($url);
my $req = HTTP::Request->new(GET => $url);
my $res = $ua->request($req);


if ($res->is_success)
{
	    print $response->decoded_content;  # Output the page content
}
else
{
	    die $response->status_line;
}

