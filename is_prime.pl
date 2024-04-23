#!/usr/bin/perl 

# This line is called a shebang. 
# It tells the system this script should
#  be executed using Perl interpreter. */

use strict;  
use warnings; 
# This pragma (Stricts) helps to catch some common errors by enforcing certain restrictions on variable declarations.
# This pragma (Warnings) enables some optional warnings that can help diagnose problems.

print "Enter a number: "; 
my $num = <STDIN>;  # This line reads the user input from the standard input (usually the keyboard)
chomp $num;  # This function removes the newline char

if (is_prime($num))  # The function is_prime() is called with $num as an argument. 
{
    print "It is prime!\n";  
}
else  
{
    print "It is not prime, try again.\n";
}

# The following lines define the function is_prime().
sub is_prime  # This line starts the definition of the function is_prime().
{
    my $n = shift;  # The shift function takes the first argument passed to the function and assigns it to the variable $n.

    if ($n <= 1)
	{
        return 0;
    }

    for my $i (2 .. sqrt($n))  # This loop checks every number from 2 to the square root of $n.
	{
        if ($n % $i == 0)
		{
            return 0;
        }
    }

    return 1;
}
