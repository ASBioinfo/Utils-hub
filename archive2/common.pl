#!/usr/bin/perl

open(FILE,"$ARGV[0]");
my $cont=0;
while(my $line=<FILE>){
chomp $line;
my $check=0;
my @nano=split(/\||\s+/,$line); #print "$nano[1]\n";

(my $demo,$check)=&SEARCH($nano[1]);
if($check==2){print "$line\t $demo\n";}
else {print STDERR"$line\n";}


}
print STDERR"$cont\n";





sub SEARCH {
open(IN,"$ARGV[1]");
my $test="";
while(my $in=<IN>){
chomp $in;
my @tato=split(/\_|\s+/,$in); #print "$tato[1]\n";
if($tato[1] eq $_[0]){  $test=$in; $cont++; close(IN); return($in,2) ;
			 }
}
close(IN);
return;
}

