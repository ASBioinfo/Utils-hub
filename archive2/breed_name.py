import sys
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]

with open (input1,"r") as file:

	for line in file:
		csk=line.split("\t")
		rcb=csk[1].split("_")

		if line.startswith("Sahiwal"):
			print ("bwa-mem2 mem -t 80 pseudohap/LGP04_pseudohap2.1.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.1.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.1.bam >"+rcb[0]+"_2.1_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.1_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.1_mapped.bam -b region.bed >"+rcb[0]+"_2.1_mapped_depth.txt\n")
			print ("bwa-mem2 mem -t 80 pseudohap/LGP04_pseudohap2.2.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.2.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.2.bam >"+rcb[0]+"_2.2_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.2_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.2_mapped.bam -b region.bed >"+rcb[0]+"_2.2_mapped_depth.txt\n\n")


		elif line.startswith("Gir"):
			print ("bwa-mem2 mem -t 80 pseudohap/LGP01_pseudohap2.1.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.1.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.1.bam >"+rcb[0]+"_2.1_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.1_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.1_mapped.bam -b region.bed >"+rcb[0]+"_2.1_mapped_depth.txt\n")
			print ("bwa-mem2 mem -t 80 pseudohap/LGP01_pseudohap2.2.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.2.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.2.bam >"+rcb[0]+"_2.2_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.2_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.2_mapped.bam -b region.bed >"+rcb[0]+"_2.2_mapped_depth.txt\n\n")


		elif line.startswith("Kankrej"):
			print ("bwa-mem2 mem -t 80 pseudohap/LGP02_pseudohap2.1.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.1.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.1.bam >"+rcb[0]+"_2.1_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.1_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.1_mapped.bam -b region.bed >"+rcb[0]+"_2.1_mapped_depth.txt\n")
			print ("bwa-mem2 mem -t 80 pseudohap/LGP02_pseudohap2.2.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.2.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.2.bam >"+rcb[0]+"_2.2_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.2_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.2_mapped.bam -b region.bed >"+rcb[0]+"_2.2_mapped_depth.txt\n\n")


		elif line.startswith("Tharparkar"):
			print ("bwa-mem2 mem -t 80 pseudohap/LGP03_pseudohap2.1.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.1.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.1.bam >"+rcb[0]+"_2.1_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.1_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.1_mapped.bam -b region.bed >"+rcb[0]+"_2.1_mapped_depth.txt\n")
			print ("bwa-mem2 mem -t 80 pseudohap/LGP03_pseudohap2.2.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.2.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.2.bam >"+rcb[0]+"_2.2_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.2_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.2_mapped.bam -b region.bed >"+rcb[0]+"_2.2_mapped_depth.txt\n\n")


		else:

			print ("bwa-mem2 mem -t 80 pseudohap/LGP05_pseudohap2.1.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.1.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.1.bam >"+rcb[0]+"_2.1_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.1_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.1_mapped.bam -b region.bed >"+rcb[0]+"_2.1_mapped_depth.txt\n")
			print ("bwa-mem2 mem -t 80 pseudohap/LGP05_pseudohap2.2.fasta ../../../processed_data/"+rcb[0]+ \
				"_trim_R1.fastq.gz ../../../processed_data/"+rcb[0]+"_trim_R2.fastq.gz |samtools sort -@ 80 -o "+rcb[0]+"_2.2.bam")
			print ("samtools view -@ 40 -b -F 4 "+rcb[0]+"_2.2.bam >"+rcb[0]+"_2.2_mapped.bam")
			print ("samtools index -b -@ 40 "+rcb[0]+"_2.2_mapped.bam")
			print ("samtools depth -a "+rcb[0]+"_2.2_mapped.bam -b region.bed >"+rcb[0]+"_2.2_mapped_depth.txt\n\n")