!#/usr/bin/perl						#usage:Always single line fasta should be provided as input.

open(FILE,"$ARGV[0]");   
			

while (my $line=<FILE>){

chomp($line);
if ($line=~/^>/) {$name= $line; next; }


my $count2=($line=~tr/ATGCatgc/ATGCatgc/);



if ($count2==0) {next;}





print "$name\n";
print "$line\n";





}

close(FILE);


