import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]

with open (input1,'r') as file1:
	for line in file1:
		if line.startswith(">"):
			line=line.strip().split()
			print (f">{line[1].strip('[]')}")

		else:
			print (f"{line.strip()}")