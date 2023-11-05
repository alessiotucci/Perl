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
my $dir = "/Users/atucci/Desktop/gitPhiloMioafter/philo";

# Command to be executed
my $cmd = File::Spec->catfile($dir, "philo") . ' && echo "Press enter to continue"';


# Change to the specified directory
chdir $dir or die $red,"Cannot change to directory $dir: $!";

# Run the 'make' command
system("make") == 0 or die "Failed to run make: $!";

# Check if the 'philo' executable exists
if (-e "philo") {
    print $green, "\n\nThe 'philo' executable exists, you can start testing.\n\n\n";
} else {
    die $red, "The 'philo' executable does not exist.\n";
}


sub test_philo {
    my @commands = (
        './philo',
        './philo 2',
        './philo 2 200',
        './philo 2 300 230',
        './philo 2 400 200 20abc'
    );

    foreach my $command (@commands) {
        print $cyan, "Running command: $command\n";
        my $output = `$command 2>&1`; # Capture both STDOUT and STDERR
        if ($? == 0) {
            print $green, "Command succeeded, but was expected to fail.\n";
        } else {
            print $green, "Command failed as expected. Error message: $output\n";
        }
    }
}

# Call the test_philo subroutine
test_philo();


