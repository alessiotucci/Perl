use strict;
use warnings;
use File::Spec;
use Term::ANSIColor;

# Define color variables
my $green = color('bold green');
my $cyan = color('bold cyan');
my $yellow = color('bold yellow');
my $red = color('bold red');
my $orange = color('bold yellow on_red');
my $purple = color('bold magenta');
my $blue = color('bold blue');
my $gray = color('bold black');
my $bold = color('bold');
my $underline = color('underline');
my $reverse = color('reverse');
my $reset = color('reset');

# Absolute path to the directory containing your program
# my $dir = "/path/to/your/program";
my $dir = "/Users/atucci/Desktop/gitPhiloMioafter/philo";
# Change to the specified directory
chdir $dir or die $red,"Cannot change to directory $dir: $!";

# Run the 'make' command
system("make") == 0 or die "Failed to run make: $!";

# Check if the 'philo' executable exists
if (-e "philo") {
    print $green, "The 'philo' executable exists, you can start testing.\n";
} else {
    die $red, "The 'philo' executable does not exist.\n";
}

# Open a new Terminal window and run the 'philo' program
my $cmd = File::Spec->catfile($dir, "philo") . ' && echo "Press enter to continue"';
system("osascript -e 'tell app \"Terminal\" to do script \"$cmd\"'");

