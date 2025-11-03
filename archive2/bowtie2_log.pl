#!/usr/bin/perl




open(FILE,"$ARGV[0]");			###############perl bowtie2_log.pl log_file.txt   where log_file.txt is the list of log files produced by Bowtie2/hisat2 for each sample

print "sample_name\tTotal_reads\ttotal_aligned_pe\tPE_data_unaligned\ttotal_aligned_se\tSE_data_unaligned\tover_all_alignment\n"; 
while ($tine=<FILE>){

chomp $tine;



& INFORMATION ($tine);


}




























sub INFORMATION {



#open(FH,"$ARGV[0]");

$file=$_[0];

@name=split(/\//,$file);
#print "$name[3]\t$name[$#name]";

open(FH,"$file");
$total_aligned_pe="";

$total_aligned_se="";





$Total_reads=();
$PE_data_aligned_c_1="";
$PE_data_aligned_c_more1="";
$PE_data_aligned_d_1="";
$PE_data_unaligned="";
$SE_data_unaligned="";
$SE_data_aligned_1="";
$SE_data_aligned_more1="";
$over_all_alignment="";

while ($line=<FH>){

@data=();


chomp $line; 

if ($line=~/\(100.00\%\) were paired/) {  @data=split (/\s+/,$line); 					$Total_reads= $data[1]
					}

elsif ($line=~/aligned concordantly exactly 1 time/) {  @data=split (/\s+/,$line); 
					$PE_data_aligned_c_1= $data[1]
					}


elsif ($line=~/aligned concordantly >1 times/) {  @data=split (/\s+/,$line); 
					$PE_data_aligned_c_more1= $data[1]
					}


elsif ($line=~/aligned discordantly 1 time/) {  @data=split (/\s+/,$line); 
					$PE_data_aligned_d_1= $data[1]
					}



elsif ($line=~/pairs aligned 0 times concordantly or discordantly/) {  
					@data=split (/\s+/,$line); 
					$PE_data_unaligned= $data[1]
					}

elsif ($line=~/\) aligned 0 times/) {  
					@data=split (/\s+/,$line); 
					$SE_data_unaligned= $data[1]
					}

elsif ($line=~/aligned exactly 1 time/) {  
					@data=split (/\s+/,$line); 
					$SE_data_aligned_1= $data[1]
					}
					
					
elsif ($line=~/aligned >1 times/) {  
					@data=split (/\s+/,$line); 
					$SE_data_aligned_more1= $data[1]
					}					
					
elsif ($line=~/overall alignment rate/) {  
					@data=split (/\s+/,$line); 
					$over_all_alignment= $data[0]
					}					
					
else {next;}				
					
		
					
	}


$total_aligned_pe=$PE_data_aligned_c_1+$PE_data_aligned_c_more1+$PE_data_aligned_d_1;
$total_aligned_se=$SE_data_aligned_1+$SE_data_aligned_more1;

#print "$Total_reads\t$PE_data_aligned_c_1\t$PE_data_aligned_c_more1\t$PE_data_aligned_d_1\t$PE_data_unaligned\t$SE_data_unaligned\t$SE_data_aligned_1\t$SE_data_aligned_more1\t$over_all_alignment\n"; 
print "$name[$#name]\t$Total_reads\t$total_aligned_pe\t$PE_data_unaligned\t$total_aligned_se\t$SE_data_unaligned\t$over_all_alignment\n"; 




return;


}
