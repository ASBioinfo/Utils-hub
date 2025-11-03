import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]
i=0
with open (input1,'r') as file1:
	for line in file1:
		if line.startswith(">"):
			i+=1
			print (f"{line.strip()}_{i}")

		else :
			print (f"{line.strip()}")