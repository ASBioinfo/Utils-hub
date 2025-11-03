#!usr/bin/perl

#%hash_chr=();



open (FILE, "$ARGV[0]");

my $seq="";$total=0;
while (my $line=<FILE>){
chomp $line;

@mi=split(/\s+/,$line);
if ($mi[11] eq "copygain"){$name =$mi[8];next;}
elsif ($mi[10] eq "DUPAL"){if ($mi[9] eq $name){	$total=$total+($mi[7]-$mi[6]+1);		}}
elsif ($mi[10] eq "INVDPAL"){if ($mi[9] eq $name){$total=$total+($mi[6]-$mi[7]+1);	}}





} 
print "#$total\n";
