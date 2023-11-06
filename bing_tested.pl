#!/usr/bin/perl
use strict;
use warnings;
use POSIX ":sys_wait_h";

# Define the commands to run
my @commands = (
		'./philo 2 400 200 200',
		'./philo 2 700 350 350',
		'./philo 2 800 400 400');
	 # Replace with your commands

# Define the colors
my $yellow = "\033[33m";
my $red = "\033[31m";
my $green = "\033[32m";
my $reset = "\033[0m";

# Run each command
foreach my $command (@commands)
{
    print $yellow, "\n---INVALID INPUT---$reset\n$command\n";

    # Start the command in the background
    my $pid = fork();
    if ($pid == 0) {
        exec($command);
        exit(0);
    }

    # Wait for the command to finish or kill it after a timeout
    my $timeout = 10; # Timeout in seconds
    my $endtime = time() + $timeout;
    while (time() < $endtime) {
        my $kid = waitpid($pid, WNOHANG);
        last if $kid > 0;
        sleep(1);
    }
    if (kill(0, $pid)) {
        kill('TERM', $pid);
        print $red, "❌\t Command took too long, killed it\n";
    } else {
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

