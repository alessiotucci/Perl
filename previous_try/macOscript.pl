use strict;
use warnings;

my $cmd = 'pwd && echo \\"Press enter to continue\\"';
system("osascript -e 'tell app \"Terminal\" to do script \"$cmd\"'");

