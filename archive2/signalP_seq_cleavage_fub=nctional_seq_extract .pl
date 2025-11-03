#!/usr/bin/perl



open(FILE, "$ARGV[0]");



while (my $line=<FILE>){
chomp $line;
if($line=~/SEQ_ID/) {next;}

@seq_site= split(/\s+/,$line);

@cleavage_site=split(/-/,$seq_site[1]);

$seq_site[1]=$cleavage_site[0];


&CLEAVAGE($seq_site[0],$seq_site[1]);


}






sub CLEAVAGE{


$seq_name=$_[0];
$cleav_site=$_[1];
#print "$seq_name\n";

open(FILE1, "$ARGV[1]");
$check=0;$new_seq="";$seq="";
while (my $line1=<FILE1>){

chomp $line1;

if ($line1=~/^>/){   
			if ($cleav_site==0) {$new_seq=$seq;$seq="";}
			 else{$new_seq=substr($seq,$cleav_site);}
			if ($check==1){print "$new_seq\n";$check=0;} 
			if($seq_name eq $') { print "$line1\n"; $check=1; $seq=""; next; }
			else{next;}
			}

if ($check==1){ $seq= $seq.$line1;      }



}
$new_seq=substr($seq,$cleav_site); if ($check==1){print "$new_seq\n";$check=0;} 
return;




}
