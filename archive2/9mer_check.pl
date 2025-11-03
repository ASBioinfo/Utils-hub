#!/usr/bin/perl

open(FILE,"$ARGV[0]");
while($line=<FILE>){
chomp $line;
if($line=~/^>/){ print "$line\n"; next;}
@nano=split(/\s+/,$line);
