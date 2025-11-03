#!usr/bin/perl

%hash_chr=();



open (FILE, "$ARGV[0]");

my $seq="";
while (my $line=<FILE>){
chomp $line;

if($line=~/^>/){ $hash_chr{$name}=$seq;$seq="";$name=$line; next;}

$seq=$seq.$line;


}
$hash_chr{$name}=$seq;


close (FILE);
=start
#print "$hash_chr{$name}\n";
$sc= ">scaffold_chr4_RagTag,>scaffold_chr5_RagTag,>scaffold_chr7_RagTag,>scaffold_chr13_RagTag,>scaffold_chr15_RagTag,>scaffold_chr17_RagTag,>scaffold_chr18_RagTag,>scaffold_chr22_RagTag,>scaffold_chr25_RagTag,>scaffold_chr26_RagTag,>scaffold_chr29_RagTag,>scaffold_chrX_RagTag" ;

@chr_name_rev=split(/,/,$sc);

foreach $i (@chr_name_rev){

#print "$i\n"; 
$seq_chr=$hash_chr{$i};

#print "$seq_chr\n";

$seq_chr=~tr/ATGCatgc/ATGCatgc/;

$hash_chr{$i}= reverse($seq_chr);

#print "$i\n$hash_chr{$i}\n";
}

=cut

@chr_name_rev=();$i="";


$sc= ">scaffold_chr1_RagTag,>scaffold_chr2_RagTag,>scaffold_chr3_RagTag,>scaffold_chr4_RagTag,>scaffold_chr5_RagTag,>scaffold_chr6_RagTag,>scaffold_chr7_RagTag,>scaffold_chr8_RagTag,>scaffold_chr9_RagTag,>scaffold_chr10_RagTag,>scaffold_chr11_RagTag,>scaffold_chr12_RagTag,>scaffold_chr13_RagTag,>scaffold_chr14_RagTag,>scaffold_chr15_RagTag,>scaffold_chr16_RagTag,>scaffold_chr17_RagTag,>scaffold_chr18_RagTag,>scaffold_chr19_RagTag,>scaffold_chr20_RagTag,>scaffold_chr21_RagTag,>scaffold_chr22_RagTag,>scaffold_chr23_RagTag,>scaffold_chr24_RagTag,>scaffold_chr25_RagTag,>scaffold_chr26_RagTag,>scaffold_chr27_RagTag,>scaffold_chr28_RagTag,>scaffold_chr29_RagTag,>scaffold_chrX_RagTag" ; 
@chr_name_rev=split(/,/,$sc);

foreach $i (@chr_name_rev){


print "$i\n$hash_chr{$i}\n";
}





