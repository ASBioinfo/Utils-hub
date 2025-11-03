#!/usr/bin/perl                                         

%hash_chr=();

open(FILE,"$ARGV[0]");   


while ($line=<FILE>)  {

@mi=split (/\s+/,$line);


$hash_chr{$mi[0]}=$mi[1] ;


}                   
close (FILE);



open(FILE1,"$ARGV[1]");  
 

while ($line1=<FILE1>)  {
chomp $line1;
my @kkr=split (/\s+/,$line1);


$i=0;
foreach $csk(@kkr) {

if (exists $hash_chr{$csk}) {$csk=$hash_chr{$csk}};

print "$csk";if ($i<$#kkr) {print "\s";$i++;}
}
print "\n";

}


