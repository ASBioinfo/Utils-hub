#!/user/bin/perl
my %hash_vcf=();
pen(FILE1,$ARGV[1]);
while($line1=<FILE1>){
chomp $line1;

my @vcf=split(/\s+/,$line1);

$name="$vcf[1];

print "$name";
my $value="$vcf[2];
#if ($name eq "NC_040079.1_20678158" ) {print "$line1\n";}

