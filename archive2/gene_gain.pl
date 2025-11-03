#!/usr/bin/perl

#@nano=qw(LC363 DSM_16222 MC1 LC81 Kp5.2 MWB1 alaskensis_RB2256 corrected_rasttk);
open(IN,"$ARGV[0]");
my $total=0;
while($in=<IN>){
chomp $in;
$in=~s/^>//;


#print "$in\n";
my $count=&GENE_GAIN($in);

$total=$total+$count;
}


print "$total\t";


sub GENE_GAIN{
#print "sarwar$_[0]\n";
open(FILE,"$ARGV[1]");

$check=0;

while($line=<FILE>) {
chomp $line;
my @nano=split(/\s+|\(/,$line);
#print "$line\n";
	foreach $moresel(@nano){
					#print "$moresel\n";
					#if($moresel eq $_[0]){ print "$moresel+$_[0]\n";$check=2;last;}
					if($moresel eq $_[0]){ $check=2;last;}

				}
}
close(FILE);
if($check==2){return (0);}
else{ return (1);}
}


