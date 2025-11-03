#!/usr/bin/perl

my %hash_vcf=();

open(FILE1,$ARGV[0]);

while($line1=<FILE1>){
chomp $line1;
if($line1=~/^#/){	if($line1=~/^##/){next;} 
			else{	my @kkr=split(/\s+/,$line1);
				print "\#sample/SNP\t";	
				for ($dc=9; $dc<$#kkr; $dc++){ print "$kkr[$dc]\t";				}
				print "$kkr[$#kkr]\n";
				}
		}
				
				


my @vcf=split(/\s+/,$line1);

$name="$vcf[0]"."_"."$vcf[1]";

if (length ($vcf[4]) >1){		next;}
elsif (length ($vcf[3]) >1){		next;}

$i=9;
$hash_allele{0}=$vcf[3];
$hash_allele{1}=$vcf[4];
$hash_allele{"."}= "-";

#print "$name\t$vcf[3]\t$vcf[4]\t";

print "$name\t";
while ($vcf[$i]){

my @gt=split (/:/,$vcf[$i]);
if ($gt[1] >6){   my @lsg=split(/\//, $gt[0]);   print "$hash_allele{$lsg[0]}$hash_allele{$lsg[1]}\t"		   }
else { print "-\t"};






$i++;

}
print "\n"
#print "\nazaaaammmmm\n";
#print "$line1\n";

}
close (FILE1);








#print "$name";
#my $value="$vcf[3]"."_"."$vcf[4]";
#if ($name eq "NC_040079.1_20678158" ) {print "$line1\n";}
#$hash_vcf{$name}=$value;








