#!/usr/bin/perl

open (FILE,"$ARGV[0]");


while ($line=<FILE>){

chomp $line;


@smile=split(/\s+/,$line);



open (FILE1, ">$smile[0].smi");

print FILE1 "$smile[1]\n";


close (FILE1);






}







