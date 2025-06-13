
#!/usr/bin/perl
use Cwd qw(abs_path);
print "mkdir out\n";
my $path= abs_path();

my $reference="/home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna";
warn "*********your refrence sequence is $reference, if it is not true change the reference sequence in program\n*********check your adaptor sequence file for fastp\n";
open (FILE, "$ARGV[0]");

while(my $line=<FILE>) {


if ($line=~/^$/){next;}
my @filename= split(/\s+/, $line);

my $input_file_R1=$filename[0]; 
my $input_file_R2=$filename[1]; 


my @base_name1=split("/", $input_file_R1 );

$base_name2= pop @base_name1;

my @base_name3=split("_R1", $base_name2 );

my $base_name=$base_name3 [0];
#print "$base_name\n";




print "mkdir $path/out/$base_name\n";

$out_folder="$path/out/$base_name";

my $trim_file1=$base_name."_trim_R1.fastq.gz";
my $trim_file2=$base_name."_trim_R2.fastq.gz";

my $sorted_bam=$base_name."_sorted.bam";
my $markdup_bam=$base_name."_markdup.bam";
my $rg_added_bam=$base_name. ".bam";
my $bam_index=$base_name. ".bai";




#print "$trim_file1\n";

print "fastp --in1 $input_file_R1 --in2 $input_file_R2 --out1 $out_folder/$trim_file1 --out2 $out_folder/$trim_file2 --adapter_fasta adapter_seq.fa --thread 16 -p --overrepresentation_analysis -l 50 -q 20 -u 20 -h $out_folder/$base_name\_report.html -j $out_folder/$base_name\_report.json -R $out_folder/$base_name\_report --trim_front1 0 --trim_tail1 0 --trim_front2 0 --trim_tail2 0 --dont_overwrite \n\n";                          

print "bwa mem $reference -t 40 -M $out_folder/$trim_file1 $out_folder/$trim_file2 | java -Dsamjdk.buffer_size=4194304 -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar SortSam R=$reference I=/dev/stdin O=$out_folder/$sorted_bam SORT_ORDER=coordinate TMP_DIR=$path/tmp\n\n";

print "java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar MarkDuplicates I=$out_folder/$sorted_bam O=$out_folder/$markdup_bam M=$out_folder/marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true TMP_DIR=$path/tmp\n\n";


print "java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar AddOrReplaceReadGroups I=$out_folder/$markdup_bam O=$out_folder/$rg_added_bam RGID=$rg_added_bam RGLB=$rg_added_bam RGPL=illumina RGPU=$rg_added_bam RGSM=$rg_added_bam TMP_DIR=$path/tmp\n\n";

print "java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar BuildBamIndex I=$out_folder/$rg_added_bam O=$out_folder/$bam_index R=$reference TMP_DIR=$path/tmp\n\n";

            
}

