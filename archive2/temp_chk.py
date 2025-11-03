import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

with open (input_file,"r") as file:
	seq=""
	contig=[]
	for line in file:
		line=line.strip()
		

		if line.startswith(">"):
			contig.append(line)
			
			seq=""
		else:
			seq+=line

	if seq:
		print (len(seq))

	print (contig)

