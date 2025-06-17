import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]

with open (input1, "r") as file1:
	for line in file1:
		csk=line.strip().split("\t")

		print (f"bwa-mem2.avx512bw mem /home/livestock/buffalo/reference/GCF_019923935.1_NDDB_SH_1_genomic.fna -t 40 {csk[0]} {csk[1]}|samtools sort -@ 40 -O {csk[2]}_sorted.bam - ")
