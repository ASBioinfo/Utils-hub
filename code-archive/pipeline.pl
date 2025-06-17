
#!/usr/bin/perl
use Cwd qw(abs_path);
print "mkdir out\n";


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


my $path= abs_path();

print "mkdir $path/out/$base_name\n";

$out_folder="$path/out/$base_name";

my $trim_file1=$base_name."_trim_R1.fastq.gz";
my $trim_file2=$base_name."_trim_R2.fastq.gz";

my $sorted_bam=$base_name."_sorted.bam";
my $markdup_bam=$base_name."_markdup.bam";
my $readgroupadded_bam=$base_name."bam"
#print "$trim_file1\n";

print "$path/bin/fastp --in1 $input_file_R1 --in2 $input_file_R2 --out1 $out_folder/$trim_file1 --out2 $out_folder/$trim_file2 --adapter_fasta $path/adapter_seq.fa --thread 16 -p --overrepresentation_analysis -l 50 -q 20 -u 20 -h $out_folder/$base_name\_report.html -j $out_folder/$base_name\_report.json -R $out_folder/$base_name\_report --trim_front1 6 --trim_tail1 5 --trim_front2 6 --trim_tail2 5 --dont_overwrite \n\n";                          

print "$path/bin/bwa mem $path/assembly/GCF_003369695.1_UOA_Brahman_1_genomic.fna -t 40 -M $out_folder/$trim_file1 $out_folder/$trim_file2 | java -Dsamjdk.buffer_size=4194304 -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar $path/bin/picard.jar SortSam R=$path/assembly/GCF_003369695.1_UOA_Brahman_1_genomic.fna I=/dev/stdin O=$out_folder/$sorted_bam SORT_ORDER=coordinate TMP_DIR=$path/tmp\n\n";

print "java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar $path/bin/picard.jar MarkDuplicates I=$out_folder/$sorted_bam O=$out_folder/$markdup_bam M=$out_folder/marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true TMP_DIR=$path/tmp\n\n";











            
}

