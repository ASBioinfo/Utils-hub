#!/usr/bin/perl
open (FILE, "$ARGV[0]");
my $check=2;
while (my $line=<FILE>){
chomp $line;

if($line=~/^>/){ if ($check==2){print "$line\n";$check=1; next;}
			else {	print "\n$line\n"; next;}
		}

print "$line";


}
print "\n";
