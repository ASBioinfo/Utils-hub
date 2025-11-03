#!/usr/bin/perl
open(FILE,"$ARGV[0]");
my $check=0;
while($line=<FILE>){
chomp $line;
if($line=~/^SeqID:/){my @nano=split(/\s+/,$line); print "\n$nano[1]\t";
			next;}
if($line=~/Localization Scores:/) {$check=1;next; }

if($check==1){ $check=0; if($line=~/Extracellular|OuterMembrane/) { print "$line\n";}}
									
						}

