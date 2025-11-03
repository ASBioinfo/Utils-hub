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


rr=[]
with open (input2,'r') as file2:
	for line1 in file2:
		if line1.startswith("contig_ID"):
			line1=line1.strip().split(",")
			for i in range (0,len(line1)):
				mi=line1[i]
				if mi in csk:
					line1[i]=csk[mi]


			rr.append(','.join(line1))
			print(f"{rr}")



		else:
			print (f"{line1.strip()}")