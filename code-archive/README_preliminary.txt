1. Taken the .sra files from NCBI(SRA). Hainan(SRR14879671), Yunnan(SRR14879657), Sahiwal(ERR4350687), Brahman(SRR14765513), Malnad gidda(SRR13778765), Bagaria(SRR13626465), Afar(SRR13626470), Seimen(SRR13626482), Bale(SRR13626471), Dianzhong(SRRSRR12739616), Indian zebu(SRR11309302), Gudali(SRR10972879), Red fulani(SRR10972880), White fulani(SRR10972881), Tharparkar(ERR3293560), Hariana(ERR3305590), Vechur(SRR8053287), Kangayam(SRR8053288), Miniature zebu(SRR6706289), Gir(SRR6706197), Nelore(SRR4280146).
2. Downloaded & Converted the .sra files into fastq file using SRA toolkit.         
	-> extract SRA toolkit .gz file...goto bin
	-> install using 
		./vdb-config
	-> download .sra using
		./prefetch --max-size **G SRR**********.sra
	-> convert .sra to .fastq using 
		./fastq-dump --split-files SRR*********.sra
3.Taken the sample files(Bachaur) in .gz format and extracted the files using gunzip.
		gunzip LGP_**********.fastq.gz
4. Checked then quality of the sequences using fastp
		fastp -i SRR*******_1.fastq -I SRR********_2.fastq -o SRR********_1p.fastq.gz -O SRR********_2p.fastq.gz --thread 16
5.checked the output html file of each sample and checked for trimming region.Did fastp analysis and trimming for all the samples using command:
		fastp --in1 SRR********_1p.fastq.gz --in2 SRR********_2.fastq --out1 SRR********_trim_1.fastq.gz --out2 SRR14879671_trim_2.fastq.gz --adapter_fasta /home/niab/ashish/bos_indicus/adapter_seq.fa --thread 16 -p --overrepresentation_analysis -l 50 -q 20 -u 20 -h SRR********_report.html -j SRR********_report.json -R SRR********_report --trim_front1 5 --trim_tail1 1 --trim_front2 5 --trim_tail2 1 --dont_overwrite 		
6. Downloaded reference genome of brahman genome assembly and indexed with bwa
		bwa index brahman_reference.fna


using *****SAMTOOLS*********
7a. Allign the specific genome with thhe reference of brahman genome using bwa
		 bwa mem ../brahman_reference/brahman_reference.fna SRR********_trim_1.fastq.gz SRR********_trim_2.fastq.gz -t 30 -o SRR********.sam
7b. sam --> bam using **SAMTOOLS**
		samtools view -@ 30 -b -o SRR********.bam SRR********.sam 
7c. bam -->mate coordinates , insert size field using fixmate
		samtools fixmate -m -r -@ 30 SRR********.bam  SRR********_fixmate.bam
7d.bam fixmate --> sorting
		samtools sort -@ 30 -o SRR********_fixmate_sorted.bam  SRR********_fixmate.bam
7e. bam sorted --> mark duplicates
		samtools markdup -r -@ 30 SRR********_fixmate_sorted.bam SRR********_sorted_dup.bam


using *****PICARD********
7A.Align the genome using BWA MEM, sort the SAM file & convert it to bam using **PICARD**
		bwa mem /home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna -t 40 -M /home/niab/ashish/bos_indicus/analysis/out/****/****_trim_R1.fastq.gz /home/niab/ashish/bos_indicus/analysis/out/****/****_trim_R2.fastq.gz | java -Dsamjdk.buffer_size=4194304 -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar SortSam R=/home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna I=/dev/stdin O=/home/niab/ashish/bos_indicus/analysis/out/****/****_sorted.bam SORT_ORDER=coordinate TMP_DIR=/home/niab/ashish/bos_indicus/analysis/tmp

7B. Mark the duplicates:
		 java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar MarkDuplicates I=/home/niab/ashish/bos_indicus/analysis/out/****/****_sorted.bam O=/home/niab/ashish/bos_indicus/analysis/out/****/****_markdup.bam M=/home/niab/ashish/bos_indicus/analysis/out/****/marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true TMP_DIR=/home/niab/ashish/bos_indicus/analysis/tmp
7C. Add or replace groups:
		java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar AddOrReplaceReadGroups I=/home/niab/ashish/bos_indicus/analysis/out/****/****_markdup.bam O=/home/niab/ashish/bos_indicus/analysis/out/****/****.bam RGID=****.bam RGLB=****.bam RGPL=illumina RGPU=****.bam RGSM=****.bam TMP_DIR=/home/niab/ashish/bos_indicus/analysis/tmp
7D. build bam index file:
		java -Dsamjdk.buffer_size=4194304 -Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.compression_level=1 -XX:ParallelGCThreads=40 -XX:ConcGCThreads=40 -Xmx100G -jar picard.jar BuildBamIndex I=/home/niab/ashish/bos_indicus/analysis/out/****/****.bam O=/home/niab/ashish/bos_indicus/analysis/out/****/****.bai R=/home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna TMP_DIR=/home/niab/ashish/bos_indicus/analysis/tmp
