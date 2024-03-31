use LWP::UserAgent;

my $url = 'http://www.atac.roma.it';
my $ua = LWP::UserAgent->new;
$ua->max_redirect( 7 ); # Set redirect limit
my $response = $ua->get($url);

if ($response->is_success) {
	    print $response->decoded_content;  # Output the page content
} else {
	    die $response->status_line;
}

