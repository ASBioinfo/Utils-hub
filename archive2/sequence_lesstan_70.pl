#!/usr/bin/perl

open(FILE,"$ARGV[0]");
while($line=<FILE>) {
chomp $line;
if($line=~/^>/){  my $seqlength= length($test);  if($seqlength>70 ){print "$header\n$test\n"; }
		 $header=$line; $test=""; next;}
 $test=$test.$line; 
}
