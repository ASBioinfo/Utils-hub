#!/usr/bin/perl

open(FILE,"$ARGV[0]");  # pangenome cluster.list should be given to get sequence from floder of pangenome. 
			#perl ../sequence_extractfrom_file.pl ../pangenomecluster_list.txt >../pangenome_sequence.fasta

while (my $line=<FILE>){



&NAME_CHANGE($line);

}
close(FILE);






sub NAME_CHANGE{
$file=$_[0];

open(IN,"$file")||die "$file not exist";
my $check=0; #print "\n\n##$file\n"; 
while(my $tine=<IN>){
chomp $tine;
if($tine=~/^>/){  $check++; if ($check==2){last;}}

print "$tine\n";
} 

close(IN);
return;
}








