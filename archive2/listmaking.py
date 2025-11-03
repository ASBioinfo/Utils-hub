import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)


input_1=sys.argv[1]


with open (input_1,"r") as file:

	for line in file:
		
		csk=line.split("\t")
		mi=csk[0].split("/")[-2]
		kkr=mi.split("_")[0]

		print ("STAR --runThreadN 40 --runMode alignReads --sjdbGTFfile ../assembly/GCF_003369695.1_UOA_Brahman_1_genomic.gtf"\
		 "--genomeDir ../assembly/ --readFilesCommand zcat --outSAMstrandField intronMotif --readFilesIn "+csk[0]+" "+csk[1]+\
		 "--outSAMtype BAM SortedByCoordinate --outFileNamePrefix"+kkr+"\n\n")
