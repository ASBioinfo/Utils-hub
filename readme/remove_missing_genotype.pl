#!/usr/bin/perl

open(FILE,$ARGV[0]);

while(my $line=<FILE>){

chomp $line;
my @mi=split (/\s+/, $line);
my $i=0;my $lsg=0;
while ($mi[$i]){


if($mi[$i] eq "-") {$lsg++;}


#print "$i\n";
$i++;
}
#print "azam\t$lsg\n";
if($lsg>2){next;}
print "$line\n";



}
