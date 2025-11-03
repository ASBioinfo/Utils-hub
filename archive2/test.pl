#!/usr/bin/perl
$file = 'passwd.txt';
#print "please provide the input file name\n";
open(INPUT,"<$file");

@in=<INPUT>;
#print"@in";
$k=@in;
$i=1;
#print "$k";
foreach $moarsel(@in)
{print "$i $moarsel";
$i=$i+1;


	
}
