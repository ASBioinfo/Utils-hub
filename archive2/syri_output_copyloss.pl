#!usr/bin/perl

#%hash_chr=();



open (FILE, "$ARGV[0]");

my $seq="";
while (my $line=<FILE>){
chomp $line;

@mi=split(/\s+/,$line);
if ($mi[11] eq "copyloss"){$name =$mi[8];next;}
elsif ($mi[10] eq "DUPAL"||$mi[10] eq "INVDPAL"){
						if ($mi[9] eq $name){$total=$total+($mi[2]-$mi[1]);}
						}


} 
print "#$total\n";
