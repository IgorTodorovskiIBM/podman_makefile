#!/usr/bin/perl
use strict;
use warnings;

my $file = $ARGV[0];
my $total_balance = 0;
my $negative_accounts = 0;
my $num_accounts = 0;

open my $fh, '<', $file or die "Could not open '$file' $!";

while (my $line = <$fh>) {
    chomp $line;
    
    if ($line =~ /Account:\s*(\d+),\s*Balance:\s*(-?\d+\.\d+),\s*Currency:\s*(\w+)/) {
        my $account = $1;
        my $balance = $2;
        my $currency = $3;

        $total_balance += $balance;
        $num_accounts++;

        if ($balance < 0) {
            print "Risk Alert: Account $account has a negative balance of $balance $currency.\n";
            $negative_accounts++;
        }
    } else {
        print "Warning: Unrecognized line format: $line\n";
    }
}

close $fh;

print "\nSummary Report:\n";
print "Total number of accounts: $num_accounts\n";
print "Total balance across all accounts: $total_balance USD\n";
print "Number of accounts with a negative balance: $negative_accounts\n";
