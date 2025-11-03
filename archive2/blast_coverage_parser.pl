#!/usr/bin/perl

open(FILE,"$ARGV[0]");
while($line=<FILE>){
chomp $line;
if($line=~/#/){ print "$line\n"; next;}
@nano=split(/\s+/,$line);


$query_cove=&QUERY_COVERAGE($nano[0],$nano[6],$nano[7],1);


$subject_cove=&QUERY_COVERAGE($nano[1],$nano[8],$nano[9],2);

if($query_cove==1 && $subject_cove==1){print "$line\n";} 



}




sub QUERY_COVERAGE {

open(IN,"$ARGV[$_[3]]");
my $totcount=0;
my $check=0;
while($in=<IN>){
chomp $in;
if($in=~/^>/){ if($check==1) {last;}  @don=split(/\s+/,$'); if($_[0] eq $don[0]) { $check=1; next;} }

if($check==1){ my $count=length($in); $totcount=$totcount+$count;next;}
else { next;}
}
close(IN);
my $value=0;
$query_coverd=$_[2]-$_[1]+1;
$coverage=($query_coverd/$totcount)*100;
if($coverage>50){ $value=1;}
return($value);
}
