#!/usr/bin/perl


open(FILE1,$ARGV[0]);

while($line1=<FILE1>){
chomp $line1;
if($line1=~/^#/){	print "$line1\n"; next;		}
				
				


my @vcf=split(/\s+/,$line1);



if (length ($vcf[4]) >1){		next;}
elsif (length ($vcf[3]) >1){		next;}

print "$line1\n"; next;
}

close (FILE1);

