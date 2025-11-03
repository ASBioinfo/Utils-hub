#!/usr/bin/perl

my %hash_vcf=();

open(FILE1,$ARGV[1]);
while($line1=<FILE1>){
chomp $line1;
if($line1=~/^#/){	next;	}

my @vcf=split(/\s+/,$line1);

$name="$vcf[0]"."_"."$vcf[1]";

#print "$name";
my $value="$vcf[6]"."_"."$vcf[7]";
#if ($name eq "NC_040079.1_20678158" ) {print "$line1\n";}
$hash_vcf{$name}=$value;


}

close(FILE1);
#@chr=(keys %hash_vcf);
#print "$chr[3]\n";
#print "$hash_vcf{NC_040079.1_20678158}\n";

open(FILE,$ARGV[0]);
while($line=<FILE>){
chomp $line;
my @snp=split(/,/,$line);
if($snp[3]!~/^\d+/){	print "$line\n"; 
			next;}




my $query="$snp[2]"."_"."$snp[3]";
#print "azam $query\n";

if(exists $hash_vcf{$query} ){  @allele=split(/_/,$hash_vcf{$query});print "$line,$allele[0],$allele[1]\n"; }
else{print "$line\n";}

}
#NC_040079.1,20678158
#NC_040079.1_20678158
#NC_040079.1_20678158
