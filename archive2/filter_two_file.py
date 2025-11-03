import sys
from signal import signal,SIG_DFL,SIGPIPE
signal(SIGPIPE,SIG_DFL)


input1=sys.argv[1]
input2=sys.argv[2]

check={}
with open (input1,'r') as file1:
	for line in file1:
		csk=line.strip().split("\t")
		check[csk[0]]=line.strip()

with open (input2,'r') as file2:
	for line1 in file2:
		mi=line1.strip().split("\t")

		if mi[0] in check:
			print (f"{check[mi[0]]}")

		else:
			print (f"{line1.strip()}\t-\t-")