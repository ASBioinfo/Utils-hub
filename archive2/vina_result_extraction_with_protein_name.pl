#!/usr/bin/perl

open (FILE, "$ARGV[0]");    		#perl vina_result_extraction.pl ./4g8A_new/list.txt /home/sarwar/lepto/docking/zinc_input/result_mol2_zinc/trl4/dataset_100/4g8A_new/
					#$ARGV[0] list of ligands used in docking

					# $ARGV[1]  is absolute path of the folder containing result directories. here  $ARGV[1]=/home/sarwar/lepto/docking/zinc_input/result_mol2_zinc/trl4/dataset_100/4g8A_new/                    



while ($line=<FILE>){
chomp $line;
@compound=split(/.pdbqt/,$line);

$ligand= "$ARGV[1]"."$compound[0]"."/"."$compound[0]"."_out.pdbqt";

#print "$ligand\n";

 &EXTRACT_RESULT($ligand);

}




sub EXTRACT_RESULT{

$file=$_[0];


open(IN, "$file")||return;

my @affinity=();
my @molecule =();
my $pen="";

while ($pen=<IN>) {
chomp $pen;
if ($pen=~/^MODEL 1/) {   $pen=<IN>; chomp $pen;  if ($pen=~/^REMARK VINA RESULT/) { @affinity=split (/\s+/, $pen); $pen=<IN>;chomp $pen; if ($pen=~/^REMARK  Name/) { @molecule= split(/=\s/,$pen);  } }}  
	else { print "$file is not correct, not starting with MODEL 1\n";}

$affinity[0]=$molecule[1];
$affinity[1]="";
$affinity[2]="";

print "$line\t@affinity\n";
return; 
}







}














