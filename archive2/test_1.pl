#!/usr/bin/perl
$file = 'passwd.txt';
#print "please provide the input file name\n";
open(INPUT,"<$file");
$i=1;
#print "$k";
#$search=the;
while($in=<INPUT>)
{
chop $in;
if ($in=~s/the/THE/i){print "$in\n";	
	
	      }
	   #   else {print "$in\n";}
	      $i=$i+1;
}


#[a-zA-Z]
