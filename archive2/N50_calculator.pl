#!/usr/bin/perl

use strict;

print"\nEnter the name of file as comand argument\n";

my $filename=$ARGV[0];
chomp $filename;
print"$filename\n";
my $p=0;
my $name="This_is_start";my @rlength=();
open(FILE,$filename);
while(my $line=<FILE>)
{chomp $line;
if($line=~/\r$/){chop $line;}
if ($line=~m/^>/){ print"$name\tlength= $p\n";push @rlength,$p;
				$name=$line;$p=0; next;     }




$b= length($line);

$p=$p+$b;
#print"$b\n\n";
}
print"$name\tlength= $p\n";
push @rlength,$p;print"Total sequences= $#rlength\n";
shift(@rlength);



#print"sarwar $rlength[0]\t$rlength[1]\t$rlength[3]\t$rlength[46883]\n";


my @clength=reverse sort { $a <=> $b } @rlength;print"largest= $clength[0]\nsmallest= $clength[$#clength]\n";
my $totalbase=0;
my $i;
for ($i=0;$i<=$#clength;$i++){
$totalbase=$totalbase+$clength[$i];
}
print"Total bases in assembly= $totalbase\n";
my $half=$totalbase/2;

$totalbase=0;
for ($i=0;$i<=$#clength;$i++){
$totalbase=$totalbase+$clength[$i];
if ($totalbase >=$half){print " N50 = $clength[$i]\n";	$i++; print " L50 = ".($i-1)."\n";	last;}
}






#README
#this code is to calculate the length of fasta file given. Output will be header and tab distance and then length of fasta sequence.
#Output will be displaced on terminal  and it can be saved as file from terminal using ">".
#Input can be single fasta or many fasta sequence files.

