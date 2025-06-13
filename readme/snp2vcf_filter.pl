#!/usr/bin/perl
my %hash_noname;
my %hash_name;
my %hash_genotype;
open(FILE1,$ARGV[0]); #genotype_table_file


while ($line1=<FILE1>){
chomp $line1;
if ($line1=~/^#/){ @name=split(/\t/,$line1);	
				foreach $rcb (@name){	
						$hash_name{$rcb}="";	
						}
			
		next;	
		}


my @rr=split(/\s+/,$line1);



$hash_genotype{$rr[0]}="";

}

close(FILE1); 




open(FILE2,$ARGV[1]); #original vcf file

while ($line2=<FILE2>){
chomp $line2;
if ($line2=~/^##/){ print"$line2\n"; next;}

if ($line2=~/^#/){ my @kkr=split(/\s+/,$line2);
			for($i=9; $i<=$#kkr; $i++){
			if(!exists $hash_name{$kkr[$i]}){ $hash_noname{$i}=""; } #print "$kkr[$i]\n"; }
				
			
				}
				
				print "$kkr[0]";
			for($j=1; $j<$#kkr; $j++){	if (exists $hash_noname{$j}){next; };
 										print "\t$kkr[$j]";
 						}
 					print "\n";
			
		}
		
@gt=split (/\s+/, $line2);


#$snp=$gt[0]."_".$gt[1];print "$snp\n";
 if (exists $hash_genotype{$gt[0]."_".$gt[1]}){print "$gt[0]";
 						for($j=1; $j<=$#gt; $j++){
 										if (exists $hash_noname{$j}){next; };
 										print "\t$gt[$j]";
 										}
 										print "\n";
 						
 						}



}		
		
		










