#!/usr/bin/perl
my %hash_seq=();

my $name1="";my $len="";

open(FILE1,"$ARGV[1]"); 
while ($line1=<FILE1>){
chomp $line1;
if ($line1 =~/^>/) {$len=length ($sequence);$hash_seq {$name1}=$len;$sequence="";	$name1=$';next;}
$sequence=$sequence.$line;


}
$len=length ($sequence);$hash_seq {$name1}=$len;

close (FILE1);



open(FILE,"$ARGV[0]"); 		
my %repeat=();$line=<FILE>;$line=<FILE>;$line=<FILE>;
while ($line=<FILE>){
chomp $line;

@kkr=split(/\s+/,$line);
if ($kkr[6]<$kkr[5]) {print "\n#####################something is wrong\n";exit;}
$len_repeat=$kkr[6]-$kkr[5]+1;
@rr=split(/\//,$kkr[10]);
$rep_name=$rr[0];
if ($kkr[4] eq $pre_name) {if (exists $repeat{$rep_name}){	$repeat{$rep_name}=$repeat{$rep_name}+$len_repeat;}
				else {$repeat{$rep_name}=$len_repeat;} 
			}
else {	foreach $morsel (keys %repeat) {
				print "$morsel-$repeat{$morsel}\t "; 

				}
				print "$hash_seq{$pre_name}\t$pre_name\n";

	$repeat{$rep_name}=$len_repeat; $pre_name=$kkr[4];
	}
		

}

