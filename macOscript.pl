use strict;
use warnings;

my $cmd = 'cd / && pwd && read -p \\"Press enter to continue\\"';
system("osascript -e 'tell app \"Terminal\" to do script \"$cmd\"'");

