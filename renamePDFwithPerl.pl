use strict;
use warnings;
use File::Find;
use File::Copy;

my $dir = 'C:\\Users\\atucci\\Desktop\\JAVA-ANGULAR'; # specify your directory here

find(\&wanted, $dir);

sub wanted {
    return unless -f; # only files
    return unless /\.pdf$/i; # only pdf files

    my $new_name = $File::Find::dir;
    $new_name =~ s/^.*[\\\/]//; # get the folder name
    $new_name .= '.pdf';

    move($_, $new_name) or die "Failed to move file: $!";
}
