#!usr/bin/perl


open(FILE1,$ARGV[0]);
while($line=<FILE1>){
chomp $line;
if ($line=~/^#/) {print "$line\n";next;}

my @kkr=split (/\s+/,$line);
 
my $name=$kkr[0];
 my %hash_allele;
    for ($dc=1; $dc<=$#kkr; $dc++){	 
  					  @mi=split (//,$kkr[$dc]);
  					  foreach $morsel(@mi){
  					  if($morsel eq "-"){next;}
  					   elsif (exists $hash_allele{$morsel}){$hash_allele{$morsel}=$hash_allele{$morsel}+1;}
  					   else {$hash_allele{$morsel}= 1;}
  					  		}                             
    
    }
             my @allele =();                    
            @allele= keys %hash_allele;
             if($#allele== -1) {print "#no data found\n"; next;}
             elsif($#allele==0) {print "#only homozygous alleles\n"; next;}
            elsif($#allele>1){warn "#data has three alleles\n ### it is abruptly stoped###\n"; exit;}
            

        
           if($hash_allele{$allele[0]} >$hash_allele{$allele[1]}){ $major_allele=$allele[0]; $minor_allele=$allele[1];  }
           else {$major_allele=$allele[1]; $minor_allele=$allele[0];  		} 
            my $total_allele= $hash_allele{$allele[0]}+$hash_allele{$allele[1]};
          
             
            my $MAF= $hash_allele{$minor_allele}/$total_allele;
              # print "azam $MAF \t$minor_allele\t$total_allele\n";
            if($MAF >0.05) {print "$line\n";}
             
             
             
 %hash_allele=();
 
 
 }
             
                               
      
