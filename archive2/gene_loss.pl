#!/usr/bin/perl

@nano=qw(LC363 DSM_16222 MC1 LC81 Kp5.2 MWB1 alaskensis_RB2256 corrected_rasttk);

foreach $moresel(@nano){
&GENE_LOSS($moresel);
}





sub GENE_LOSS{
open(FILE,"$ARGV[0]");

$count=0;

while($line=<FILE>) {
chomp $line;
#print "$line\n";
if($line=~/\($_[0]\)/){ next;}
else{$count++;print "##### $_[0]\t$line\n";}

}

print "$_[0]\t$count\n";
return;


}



