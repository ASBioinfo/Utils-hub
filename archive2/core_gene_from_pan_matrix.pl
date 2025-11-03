#!/usr/bin/perl						
			#Usage:  



open(FILE,"$ARGV[0]");   
			

while (my $line=<FILE>){

chomp $line;

@honda=split (/\s/,$line);
my $check=1;
foreach $morsel (@honda){
if ($morsel== "0"){ $check=2; last;}
}


if($check==1){ print "$line\n";}




}
