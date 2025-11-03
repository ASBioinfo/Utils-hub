#!/usr/bin/perl -w
open(INFILE, "$ARGV[0]");
while($line = <INFILE>)
 {
   if($line !~ /^>/)
     {
        if($line =~ /\+/)
          {
             @lineArray = split(/\+/, $line);
             print "$lineArray[0]\n";
           }
        else
         {
           print $line;
         }
     }
   else
    {
       print $line;
    }
}
