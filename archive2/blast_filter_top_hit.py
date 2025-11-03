import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]

check=""
with open (input1,'r') as file1:
	for line in file1:
		csk=line.strip().split("\t")

		if csk[0] != check:
			print (line.strip())
			check=csk[0]

