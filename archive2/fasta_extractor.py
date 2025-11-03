import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]


with open (input_file,"r") as file:
	csk=[line.strip() for line in file]


input_file2=sys.argv[2]

with open (input_file2,"r") as file2:
	seq=False
	
	for line2 in file2:
		line2=line2.strip()

		if line2.startswith(">"):
			if line2[1:] in csk:
				seq=True
			else:
				seq=False

		if seq:
			print (line2)