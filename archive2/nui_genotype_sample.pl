#!/usr/bin/perl
my %hash_nui=();
my %hash_fasta=();




open(FILE1,"$ARGV[1]"); 	

while ($line1=<FILE1>){

chomp $line1;
my @csk=split(/\t/, $line1);

$hash_nui{$csk[0]}[$csk[1]][1]= $csk[3];
$hash_nui{$csk[0]}[$csk[1]][2]= $csk[4];

}

close(FILE1);




print "##name\t1\tcoverage_prc(>80%)\tidentity_prc(>90%)\n";

open(FILE,"$ARGV[0]"); 		
$name1="##start";
my $sequence="";
#my $length_nui;
while ($line=<FILE>){
chomp $line;
if ($line =~/^>/) {	&GENOTYPE($sequence,$name1);	
			$sequence="";
			$name1=$';next;
		}
$sequence=$sequence.$line;


}

&GENOTYPE($sequence,$name1);
close(FILE);
%hash_nui=();
%hash_fasta=();
%hash_mc=();











sub GENOTYPE{ 
my $seq=$_[0];
my @rcb=split(//,$seq);
my $name=$_[1];
my $nui_length=length($seq);#print "azam seq_len=$rr\n";


my $identity=0;my $coverage=0;my $k=0;
for ($l=1; $l<= $nui_length; $l++){


if ($hash_nui{$name}[$l][1] >0){ $coverage++;if ($hash_nui{$name}[$l][2] eq $rcb[$k]) {	$identity++;	}		} #print "azam\t$name\tdepth=$hash_nui{$name}[$l][1]\tbasecall=$hash_nui{$name}[$l][2]\t refrence=$rcb[$l-1] \n";
			        			
$k++;
}


my $coverage_prc ;my $identity_prc;
if ($coverage==0) {$coverage_prc=0;}
else {$coverage_prc=$coverage/$nui_length;}
if ($identity==0) {$identity_prc=0;}
else {$identity_prc=$identity/$coverage;}
#print "$name\t$rr\t$nui_length\t$coverage\t$coverage_prc\t$identity\t$identity_prc\n";											
if ($coverage_prc>0.8 && $identity_prc>0.9) {print "$name\t1\t$coverage_prc\t$identity_prc\n";}
else {print "$name\t0\n";}


return;
}

































#while ($line=<FILE>){
#chomp $line;
#if ($line =~/^>/) {	@srh= split(/:|-/,$');			if (exists $hash_fasta{$srh[0]} ) {  if ($hash_fasta{$srh[0]}[1] < $srh[1]) {  } else { $hash_fasta{$srh[0]}[1]=$srh[1];	} 
#												if ($hash_fasta{$srh[0]}[2] > $srh[2]) {  } else { $hash_fasta{$srh[0]}[2]=$srh[2];	}
#
#												}
#							else {$hash_fasta{$srh[0]}[1]=$srh[1]; $hash_fasta{$srh[0]}[2]=$srh[2]; }
#		}
#
#
#}



