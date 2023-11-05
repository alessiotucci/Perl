# File: subroutine.pl

sub test_philosopher
{
    my ($output, $num_meals) = @_;
    my %eat_count;

    # Split the output into lines
    my @lines = split "\n", $output;

    # Process each line
    foreach my $line (@lines)
				{
        # If the line indicates a philosopher has started eating
        if ($line =~ /philo (\d+) is eating/)
								{
            # Increment the count for this philosopher
            $eat_count{$1}++;
        }
    }

    # Check if any philosopher has eaten less than the required number of meals
    foreach my $philo (keys %eat_count)
				{
        if ($eat_count{$philo} < $num_meals)
								{
            print "Philosopher $philo has eaten only $eat_count{$philo} meals\n";
        }
    }
}

