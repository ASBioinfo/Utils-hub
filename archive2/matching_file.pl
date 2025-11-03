#!/usr/bin/perl

open(FILE1,$ARGV[1]);
while($line1=<FILE1>){
chomp $line1;
Print "$line1\n";
};

