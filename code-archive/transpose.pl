#!/usr/bin/perl

my %hash_matrix;						#perl t
 my $i=0;my $j=0;
open(FILE, $ARGV[0]);open(FILE1, ">transpose_$ARGV[0]");
while (my $line = <FILE>)
{  
chomp $line;
my@GT=split (/\s+/,$line); 
 $j=0;
foreach $mi (@GT){

$hash_matrix{$j}{$i}=$mi;
$j++;
}


print "$i\r";

$i++;
}
close(FILE);
print "\n";

#print "i=$i\nj=$j\n";



#open(FILE1, ">transpose_$ARGV[0]");

for (my $l=0; $l<$j; $l++){
	for (my $m=0; $m<$i; $m++){

				print FILE1 "$hash_matrix{$l}{$m}\t";
				
				


				}
				print FILE1 "\n";
			}


close(FILE1);




