import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]
input2=sys.argv[2]

csk={}

with open (input1,'r') as file1:
	for line in file1:
		line=line.strip().split("\t")

		key=line[0]
		value=line[1]
		csk[key]=value

with open (input2,'r') as file2:
	for line1 in file2:
		line1=line1.strip()

		if line1 in csk:
			print (f"{line1}\t{csk[line1]}")

		else:
			print (f"{line1}\tQTL not found")