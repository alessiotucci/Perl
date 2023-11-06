#!/usr/bin/perl
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
if (-e "philo")
{
    print $green, "\n\nThe 'philo' executable exists, you can start testing.$reset\n\n\n";
}
else
{
    die $red, "The 'philo' executable does not exist.$reset\n";
}

sub test_philo
{
	print "starting with error handling\n";
    my @commands =
	(
        './philo',
        './philo 2',
        './philo 2 200',
        './philo 2 300 230',
        './philo 2 400 200 20abc',
        './philo 2a 400 200 20abc',
        './philo 2 400 h200 20',
        './philo 2 40b0 200 20c',
		'./philo -1 400 200 200',
		'./philo 2 -400 200 200',
		'./philo 2 400 -200 200',
		'./philo 2 400 200 -200',
    );

foreach my $command (@commands)
{
        print $yellow, "\n---INVALID INPUT---$reset\n$command\n";
        my $output = `$command 2>&1`; # Capture both STDOUT and STDERR

        # Split the output into lines
        my @lines = split /\n/, $output;

        # Check the number of lines in the output
        if (scalar @lines > 2)
		{
            print $red, "❌\t Command output is too long\n$output\n";
        }
		else
		{
            print  "$output\n✅ $green  seem ok to me $reset\n";
        }
    }
}
# Define a subroutine called 'test_philo_death'
sub test_philo_death
{
    print "starting the real check\n";
    # Define an array of commands to be executed
    my @commands = (
        './philo 1 400 200 200',
        './philo 1 800 200 200',
        './philo 2 400 200 200',
        './philo 2 600 600 200',
        './philo 2 700 350 350',
		'./philo 3 400 200 200',
		'./philo 5 500 300 200',
		'./philo 4 600 300 300',
		'./philo 6 800 400 400'
    );

    # Loop through each command in the array
    foreach my $command (@commands)
    {
        print $purple, "\n---DEATH FOR SURE---$reset\n$command\n";
        # Execute the command and capture both STDOUT and STDERR
        my $output = `$command 2>&1`;

        # Check if the output contains the word "died"
        if ($output =~ /died/)
        {
        # Split the output into lines
    	my @lines = split /\n/, $output;

    	# Loop through each line
    	foreach my $line (@lines)
		{
        # If the line contains the word "died", print it
        if ($line =~ /died/)
		{
            print  "$line\n$green A philosopher died as expected $reset \n";
        }
    	}
		}
        else
        {
            print $red, "No philosopher died, but was expected to.$reset\nOutput: $output\n";
        }
	}
}
# Define a subroutine called 'testy'
sub testy
{
    # Print a message indicating the start of the meal check
    print "Starting the meal check\n";

    # Define an array of commands to be executed
    # In this case, there's only one command, but you can add more if needed
    my @commands = (
        './philo 2 800 200 100 2'
    );

    # Loop through each command in the array
    foreach my $command (@commands)
    {
        # Print the command that's being executed
        print "\n---CHECKING FOR MEALS---\n$command\n";

        # Execute the command and capture both STDOUT and STDERR
        # The `2>&1` part redirects STDERR to STDOUT, so both are captured
        my $output = `$command 2>&1`;
		# Get the number of meals from the subroutine's arguments
        my ($num_meals) = @_;
		# Initialize a hash to store the count of meals for each philosopher
        my %eat_count;
		# Split the output into lines
        my @lines = split "\n", $output;
		# Process each line
        foreach my $line (@lines)
        {
			# If the line indicates a philosopher has started eating
			if ($line =~ /eating/)
			{
				print "$line\n";
				# Perform additional checks inside the if block	
			}

        }

        # Check if any philosopher has eaten less than the required number of meals
        foreach my $philo (keys %eat_count)
        {
            if ($eat_count{$philo} < $num_meals)
            {
                # Print a message indicating that this philosopher has not eaten enough meals
                print "Philosopher $philo has eaten only $eat_count{$philo} meals\n";
            }
			else
			{
                print "Philosopher $philo has eaten $eat_count{$philo} meals\n";
			}
        }
    }
}

# Call the test_philo subroutine
test_philo();
# Call the test_philo_death subroutine
test_philo_death();
# Call the subroutine to check if philospher eat enough
# Call the test_philosopher subroutine
testy();
# Call the subrouting for few second to check if philosopher dies 


