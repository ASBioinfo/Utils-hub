#!/usr/bin/perl

use strict;



my $filename=$ARGV[0];
chomp $filename;

my $p="";
my $name="This_is_starat";
my $a=0;

open(FILE,$filename);
while(my $line=<FILE>)
{					#print "azam\n";
if($line=~/\r$/){chop $line;}
if ($line=~/^>/){ 	chomp $p;
			 $a=length ($p);
		if ($a==0){$name=$line;$p=""; $a=3; next;  }
		  else {print"$name$p\n"; $name=$line;$p=""; next;}
		 }




$p=$p.$line;
#print"$b\n\n";

}

chomp $p;

$a=length ($p);
if ($a==0){   }
 else {print"$name$p\n";  }






