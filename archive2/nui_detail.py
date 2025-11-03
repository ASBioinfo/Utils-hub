import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

with open (input_file,"r") as file:

	for line in file:
		line=line.strip()

		csk=line.split("\t")
		mi=csk[10].split(";")
		for i in mi:
			
		print (csk[9],"\t",csk[10])