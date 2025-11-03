#!/usr/bin/perl

open(FILE,"$ARGV[0]");
%hash_file1=();

while($line=<FILE>){
chomp $line;
if($line=~/^$/){next;}
@nano=split(/\s+/,$line);
$hash_file1{$nano[0]}=$hash_file1{$nano[0]}+1;
}
close(FILE);



open(IN,"$ARGV[1]");
%hash_file2=();

while($in=<IN>){
chomp $in;
if($in=~/^$/){next;}
@nano=split(/\s+/,$in);
$hash_file2{$nano[0]}=$hash_file2{$nano[0]}+1;
}
close(IN);




print "## list of redundent Elements in file1=$ARGV[0]\n" ;
$count=0; my (@uniq_file1,@uniq_file2,@common);
while(($name,$freq)=each (%hash_file1)) {

if($freq>1){$count++; print "$name\t$freq\n";}
if(exists $hash_file2{$name}){push(@common,$name);} 
else { push(@uniq_file1,$name);}
}

print "\t# total redundent Elements in file1=$count\n\n\n\n" ;



print "## list of redundent Elements in file2=$ARGV[1]\n" ;
$count=0;
while(($name,$freq)=each (%hash_file2)) {

if($freq>1){ $count++;print "$name\t$freq\n";}
if(!exists $hash_file1{$name}){push(@uniq_file2,$name);}
}


print "\t#total redundent Elements in file2=$count\n\n\n\n" ;


$count=0;
print "##list of common elements\n"; 
foreach $moresel(@common){$count++;print "$moresel\n";}
print "\t#total common elements=$count\n\n\n\n";


print "## list ofuniq element to file1=$ARGV[0]\n";
$count=0;
foreach $moresel(@uniq_file1){$count++;print "$moresel\n";}
print "\t#total uniq elements in file1 =$count\n\n\n\n";


print "## list ofuniq element to file2=$ARGV[1]\n";
$count=0;
foreach $moresel(@uniq_file2){$count++;print "$moresel\n";}
print "\t#total uniq elements in file2 =$count\n\n\n\n";






