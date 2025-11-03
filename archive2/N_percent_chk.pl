#!/usr/bin/perl						#usage:

open(FILE,"$ARGV[0]");   
			

while (my $line=<FILE>){

if ($line=~/^>/) {chomp($line);$name= $line; next; }


my $count=($line=~tr/N/N/);
my $mi=length ($line);
my $ratio=$count/$mi;
print "$name\t$count\t$mi\t$ratio\n"; 



}

close(FILE);


