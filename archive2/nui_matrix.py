import sys
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)

file1= sys.argv[1]

with open (file1 ,"r") as file:
	print ("chr\tstart\tend\tnui")	
	for line in file:
		line=line.strip()
		kkr=line.split("\t")
		csk=kkr[-2].split(";")
		
		print (kkr[0]+"\t"+kkr[1]+"\t"+kkr[2]+"\t"+kkr[-3]+"\t"+"\t".join(csk))







