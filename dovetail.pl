#!/usr/bin/perl -w

use strict;

# usage: perl dovetail.pl <base data> <add on> ... <add on>

my@datasets = ();

foreach my$arg(1..$#ARGV){
    open(F, $ARGV[$arg]) or die "$ARGV[$arg]: $!";
    my@f=<F>;
    chomp@f;
    push@datasets,[ map { [ split(/\s+/, $_) ] } @f  ];
}

foreach my$row(0..(scalar($datasets[0]) - 1)){
    $base = $datasets[0]->[$row];
    print "$base->[0]\t";
    foreach my$ds(1..$#ARGV){
	die "mismatch: $ds $row" unless $datasets[$ds]->[$row]->[0] eq $datasets[0]->[$row]->[0];
	print $datasets[$ds]->[$row]->[1]."\t";
    }
    print "$base->[1]\n";
}

    

