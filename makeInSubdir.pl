#!/usr/bin/perl
use strict;
use warnings;
use Cwd;

# Get the current directory
my $dir = getcwd;

# Open the current directory
opendir(DIR, $dir) or die "Could not open $dir\n";

# Read files and directories
while (my $file = readdir(DIR)) {
    # If the file is a directory
    if (-d $file) {
        chdir $file;
        system("make");
        chdir '..';
    }
}

# Close the directory
closedir(DIR);
