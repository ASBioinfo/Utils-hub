#!/usr/bin/perl

open( FILE, "$ARGV[0]");

my %hash_name=();
while ($line=<FILE>)
{

chomp $line;

@name=split(/\t/, $line);


$hash_name{$name[1]}=$name[0];

}
close (FILE);




open( FILE1, "$ARGV[1]");

while ($line1=<FILE1>)
{
chomp $line1;
my @data=();
@data=split(/\t/, $line1);


for (my $i=0; $i<=$#data; $i++)
{
#print "sarwar\n";
if (exists $hash_name{$data[$i]}){print "$hash_name{$data[$i]}";}
#else {print "$data[$i]";}
else {my $rata=$data[$i];print "$rata";}
if($i==$#data){print "\n";}
else {print "\t";}

}


}


