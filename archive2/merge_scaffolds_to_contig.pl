#!/usr/bin/perl

open(FILE,$ARGV[0]);
my $check=0;
my $signal=0;
while(my $line=<FILE>){


if ($line=~/^>/) {	if($line=~/^>NC_/){$check=2; print "$line"; next;	}
			else {$check=0; $signal=$signal+1;if ($signal==1){ print ">NC_040106.1 Bos indicus x Bos taurus breed Angus x Brahman F1 hybrid chromosome unplaced, Bos_hybrid_MaternalHap_v2.0, whole genome shotgun sequence\n"; next;}
			print "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN\nNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN\n" ; next;}
	}


	print "$line";	
								


}






