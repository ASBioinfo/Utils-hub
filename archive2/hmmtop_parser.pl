#!/usr/bin/perl
open(FILE,"$ARGV[0]");
my $check=0;
while($line=<FILE>){
chomp $line;
if($line=~/^Protein:/){my @nano=split(/\s+/,$line); print "$nano[1]\t";
			next;}
if($line=~/^Number of transmembrane helices:/) { print "$line\n";}

}
									
	
