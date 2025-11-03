#!/usr/bin/perl
$file = 'passwd.txt';
#print "please provide the input file name\n";
open(INPUT,"<$file");

@in=<INPUT>;


$i=1;
while($in=<INPUT>)
{
print $in;
chop $in;
#print "$i $in";
#[a-zA-Z]
if  ($in=~/the|The/ ){print "$i $in\n";	
	$i=$i+1;
   	     }
print "mohd";
}
