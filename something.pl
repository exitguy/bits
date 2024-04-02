#!/usr/bin/perl
# Bogus task v0.3
# Written by ChatGPT and slightly modified by Ex-IT guy

use strict;
use warnings;

# Process command-line arguments
use Getopt::Std;
my %options=();
getopts('hst:b:', \%options);

if (defined $options{h}) {
  print "Usage: ${0} [-s | -t <seconds> | -b \"banner\"]\n\n";
  exit;
}

# Define the total duration of the simulation in seconds
our $total_duration;
if (defined $options{t}) {
  $total_duration = $options{t};
} else {
  $total_duration = 23456;
}

# Define the update interval in seconds (adjust as needed)
my $update_interval = 1;

# Initialize variables
my $start_time = time;
my $current_time = $start_time;
my $last_percentage = -1;

# Intro
if (defined $options{b}) {
  print "$options{b}\n";
} else {
  print "Doing something...\n";
}

# Main loop
while ($current_time - $start_time < $total_duration) {
    # Calculate elapsed time
    my $elapsed_time = $current_time - $start_time;

    # Calculate percentage complete
    my $percentage_complete = ($elapsed_time / $total_duration) * 100;

    # Only update if percentage has changed
    if ($percentage_complete != $last_percentage) {
        if (defined $options{s}) {
            printf("%03d\n", $percentage_complete);
        } else {
            # Clear previous line
            print "\r\e[K";

            # Print time elapsed and percentage complete
            printf("Time Elapsed: %02d:%02d:%02d  |  Percentage Complete: %.2f%%",
                $elapsed_time / 3600, ($elapsed_time % 3600) / 60, $elapsed_time % 60,
                $percentage_complete);
        }
        # Flush output to display changes immediately
        $| = 1;

        # Update last percentage
        $last_percentage = int($percentage_complete);
    }

    # Wait for the update interval
    sleep($update_interval);

    # Update current time
    $current_time = time;
}

# Print completion message
print "\nDone!\n";
