#!/usr/bin/perl
$file = 'file.txt';

open(INPUT,"<$file");

@in=<INPUT>;

#print @in;
$i=1;
while($in=<INPUT>)
{
print $in;
chop $in;
#print "$i $in";
#[a-zA-Z]
if  ($in=~/mohammad/){print "$in\n";	
	$i=$i+1;
   	     }
#print "mohd";

}
