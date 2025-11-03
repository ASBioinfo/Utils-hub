#!/usr/bin/perl

open(FILE,"$ARGV[0]");
my $check=0;
$i=1;
open(OUT,">$i.txt");
while($line=<FILE>) {
chomp $line;

if($line=~/>/){$check+=1; if($check>100){ $check=1; close(OUT); $i++;open(OUT,">$i.txt");} }

print OUT"$line\n"; 

}

close(OUT);
close(FILE);
