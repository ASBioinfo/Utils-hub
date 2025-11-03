#!/usr/bin/perl

my %hash_contig=();


open(FILE1,"$ARGV[0]"); 
while ($line1=<FILE1>){
chomp $line1;

$hash_contig{$line1}="";

}

close(FILE1);




my $check=0; my @name=();

open(IN,"$ARGV[1]");

while(my $tine=<IN>){
chomp $tine;

if($tine=~/^>/){ @name=split(/\s+/,$'); if(exists $hash_contig{$name[0]}) { $check=1; }
                                        else{   $check=0;   }
                }


if($check==1){print "$tine\n"; }

} 

close(IN);
