use strict;
use warnings;
use HTTP::Tiny;
use HTML::TreeBuilder;

# Create a new HTTP::Tiny object
my $http = HTTP::Tiny->new;

# Make a GET request to the target website
my $response = $http->get('http://example.com');

# If the request was successful...
if ($response->{success})
{
    # Parse the HTML content
    my $tree = HTML::TreeBuilder->new_from_content($response->{content});

    # Find all 'a' elements
    my @links = $tree->look_down('_tag', 'a');

    # Print the href attribute of each 'a' element
    foreach my $link (@links)
	{
        print $link->attr('href'), "\n";
    }
}

