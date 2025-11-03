#!/usr/bin/perl

@nani=qw(LC363 DSM_16222 MC1 LC81 Kp5.2 MWB1 alaskensis_RB2256 corrected_rasttk);
=for
for($i=0;$i<8;$i++){
  for($j=$i+1;$j<8;$j++){
	@name=($nani[$i],$nani[$j]);&GENE_SEARCH(\@name);
		#print "@name\n";
			}
		}
#@name=($name1,$name2);
#&GENE_SEARCH(\@name);
=cut

use warnings;
use Algorithm::Combinatorics qw(combinations);

my $strings = [@nani];
for($i=2;$i<9;$i++){
my $iter = combinations($strings, $i);

while (my $name = $iter->next) {
    #print "@$c\n";
	&GENE_SEARCH($name);
}
}

sub GENE_SEARCH{
@nano=@{$_[0]};
open(FILE,"$ARGV[0]");

$group_num=$#nano+1;
while($line=<FILE>) {
chomp $line;
$count=0;
foreach $moresel(@nano){

if($line=~/\($moresel\)/){ $count++;}

}
if($count==$group_num){ print "$group_num\t@nano\n";}



}




}


