#!/usr/bin/perl
$file = 'passwd.txt';
#print "please provide the input file name\n";
open(INPUT,"<$file");

@in=$file;
#print"@in";

$i=1;
#print "$k";
while($in=<INPUT>)
{
chop $in;
#print "$i $in";
if ($in){print "$i $in\n";	
	$i=$i+1;
	}
else{print "\n";
#	$i=$i-1;
	#print "sarwar";
    }

#$i=$i-1;


	
}
