#!/usr/bin/perl
my %hash_chordtaxid=();

open (FILE, "$ARGV[0]");

while(my $line=<FILE>) {
chomp $line;
#my @kkr=split(/\s+/,$line);
$hash_chordtaxid {$line}="";

#print "sarwar--$kkr[0]\n";

}


close (FILE);

#print "startAAAAAAAAAAAAAAAAAA\n";	
	
open (FILE1, "$ARGV[1]");my $check=0;
while(my $line1=<FILE1>) {	
chomp $line1;
#print "azam--$line1\n";
#my @csk=split(/^>/,$line1);
if ($line1=~/^>/) {@csk=split (/\s+/,$line1);
			if (exists $hash_chordtaxid {$csk[0]} ) { print "$csk[0]\n";$check=2;next;}
			else {$check=0;next;}
					} 

if ($check==2) {print "$line1\n";}

}
