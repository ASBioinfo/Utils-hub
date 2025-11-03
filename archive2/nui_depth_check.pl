#!/usr/bin/perl
my %hash_nui=();
open(FILE,"$ARGV[0]"); 		


while ($line=<FILE>){

chomp $line;

#my @mi=split(/SN:|LN:/, $line);

@mi=split(/SN:|LN:/, $line);

$end= $mi[2]-300; 
$hash_nui{$mi[1]}=$end;


}

close(FILE);


open(FILE1,"$ARGV[1]");
my $previous_name=""; my $check=0; my $check2=0;
while ($line1=<FILE1>){

chomp $line1;

my @csk=split(/\t/, $line1);
if ($previous_name ne $csk[0]) { $check=0;$check2=0;$previous_name=$csk[0];}

if (exists $hash_nui{$csk[0]}){
				if ($check2==2){next;}
			if ($csk[1]>300  && $csk[1]<$hash_nui{$csk[0]}) {  if ($csk[2] >0){ $check++;} }
			elsif ($csk[1] >$hash_nui{$csk[0]}){ print "$hash_nui{$csk[0]}\t $check"; $check=0; $check2=2; $previous_name=$csk[0];		}									
												
								
			  }

}
close(FILE1);


