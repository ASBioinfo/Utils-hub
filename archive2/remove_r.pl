#!/usr/bin/perl

open(FILE,"<$ARGV[0]");


while (my $line=<FILE>){

if ($line=~/\r/){ chomp $line; chop $line; print "$line\n";}

else{print "$line";}

}
close (FILE);








