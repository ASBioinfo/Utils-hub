#!/usr/bin/perl
$file = 'passwd.txt';
#print "please provide the input file name\n";
open(INPUT,"<$file");
$i=1;
#print "$k";
$ARGV[0];

$search=$ARGV[0];

#s/([A-Z])/:\1:/g;
while($in=<INPUT>)
{
chop $in;
if ($in=~s/$search/\($search\)/gi){print "$in\n";	
	
	      }
	   #   else {print "$in\n";}
	      $i=$i+1;
}

