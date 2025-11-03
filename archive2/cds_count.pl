#!/usr/bin/perl
open(FILE,"$ARGV[0]");

$tag=0;

while($line=<FILE>){
my $line1; my $TAG;
if($line=~/locus_tag=/){ $line1=$line; @nano=split(/"/,$line); @locus=split(/_/,$nano[1]);
						if($locus[1]<10){$TAG="0000$locus[1]";}
						elsif($locus[1]<100){$TAG="000$locus[1]";}
						elsif($locus[1]<1000){$TAG="00$locus[1]";}
						else{$TAG="0$locus[1]";}
                                                $nano[1]=$locus[0]."_".$TAG;
                                                print @nano; next;
			}
#if($line=~s/locus_tag="RASTtk_*$/locus_tag="RASTtk_$TAG"/) { print "$line"; next; }

print "$line";

}

close(FILE);
