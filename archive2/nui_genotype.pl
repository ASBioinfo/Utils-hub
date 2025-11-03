#!/usr/bin/perl
my %hash_nui=();my @sample=();
open(FILE,"$ARGV[0]"); 		

while ($line=<FILE>){
chomp $line;
&GENOTYPE($line);

}

close(FILE);

print "nui\t";
for ($i=0; $i<=$#sample; $i++){


print "$sample[$i]\t"


}
print "\n";




foreach $morsel (keys %hash_nui){
print "$morsel\t";
for ($i=0; $i<=$#sample; $i++){


print "$hash_nui{$morsel}[$i]\t"


}
print "\n";




}



sub GENOTYPE{ 
$seq=$_[0];		#Gir_14_nui_PAV
my @dd=split (/_filtered_genotype.txt/,$seq);
push @sample, $dd[0];

open(FILE1,"$seq");

while (my $line1=<FILE1>){

chomp $line1;
if ($line1 =~ /^##/) {next;}
my @kkr=split (/\s+/,$line1);
if ($kkr[1]>0) {if ($kkr[2] >=0.5 && $kkr[3] >=0.8) {$kkr[1]=1;} else {$kkr[1]=0;}}
if (exists $hash_nui{$kkr[0]}) {	$hash_nui{$kkr[0]}[$#sample]=$kkr[1];	}

else {	$hash_nui{$kkr[0]}[$#sample]=$kkr[1]; 	if ($#sample>0) {print "#there something wrong\n";}		}		


}


close(FILE1);
return ;
}


