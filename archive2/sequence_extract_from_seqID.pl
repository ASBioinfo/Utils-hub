#!/usr/bin/perl				#USEAGE:  /lepto/chapter2$ perl sequence_extract_from_seqID.pl nonredundentset_525_from_all3pred_seqID.txt 
					# ./softcore_pathogenic/Pathogenic_soft_core_t0_list.fasta > nonredundentset_525_from_all3pred_seqID.fasta

open(FILE,"$ARGV[0]"); 			#query file with ids in that i.e /lepto/chapter2/nonredundentset_525_from_all3pred_seqID.txt 

while (my $line=<FILE>){		# and file with id and sequence  i.e /lepto/chapter2/softcore_pathogenic/Pathogenic_soft_core_t0_list.fasta.
					# and output as :/lepto/chapter2/nonredundentset_525_from_all3pred_seqID.fasta.
chomp $line;
#print "$line\n";
&NAME_CHANGE($line);

}
close(FILE);






sub NAME_CHANGE{
my $query=$_[0];

open(IN, "$ARGV[1]");
my $check=0;
while(my $tine=<IN>){
chomp $tine; 


if($tine=~/^>/){ 
			if ($check==1) {$check=0;last;}
				$check=2; #print "$'\n";
				my @car=split(/\s+/,$'); if ($car[0] eq $query){$check=1;}      
                    }
if ($check==1) {
			print "$tine\n";
			}

} 

close(IN);
return;
}








