#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
use HTML::TreeBuilder 5 -weak;  # Ensure weak references are used

# Create a user agent object
my $ua = LWP::UserAgent->new;
$ua->timeout(10);
$ua->agent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36');

# Define the URL
my $url = 'https://romamobilita.it/it/muoversiaroma/linee-orari-metro-roma';

# Create an HTTP request
my $req = HTTP::Request->new(GET => $url);

# Send the request and receive a response
my $res = $ua->request($req);

# Check if the request was successful
if ($res->is_success) {
    print "Successfully accessed the page.\n";
    
    # Parse the HTML content
    my $content = $res->decoded_content;

    # Initialize HTML TreeBuilder for parsing
    my $tree = HTML::TreeBuilder->new;
    $tree->parse($content);
    $tree->eof;

    # Example: Extracting all links from the page
    my @links = $tree->look_down(_tag => 'a');
    foreach my $link (@links) {
        my $url = $link->attr('href');
        print "Link found: $url\n" if defined $url;
    }

    # Clean up tree to avoid memory leaks
    $tree = $tree->delete;
} else {
    # If the request fails, output the status and reason
    print "Failed to access the page: ", $res->status_line, "\n";
    # Handle specific failure cases (e.g., 403 Forbidden or 429 Too Many Requests)
    if ($res->code == 403) {
        print "Access denied (403). You may need to handle anti-bot protections.\n";
    } elsif ($res->code == 429) {
        print "Too many requests (429). Try adding a delay between requests.\n";
    }
}
