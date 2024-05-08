#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $cgi = CGI->new;

print $cgi->header('text/html');

print <<'END_HTML';
<!DOCTYPE html>
<html>
<head>
    <title>My Web Page</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <h1>Welcome to my web page!</h1>
    <p id="content"></p>
</body>
</html>
END_HTML
