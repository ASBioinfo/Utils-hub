import sys
import numpy as np
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)


input1=sys.argv[1]
#print (f"query id,subject id,evalue,bit score,% identity,alignment length,subject titles,q. start,q. end,query length,s. start,s. end,subject length,identical,mismatches,gap opens,gaps,% query coverage per subject,% query coverage per hsp")
with open (input1,'r') as file1:
	for line in file1:

		if line.startswith("#"):
			pass

		else:
			csk=line.strip().split("\t")
			check1=float(((abs(float(csk[11])-float(csk[10]))+1)/float(csk[12]))*100)
			check1=round(check1,3)
			if (check1>=50) and float(csk[4])>=80 and float(csk[17])>=80 and np.less_equal(float(csk[2]), 1e-10):
				print (f"{line.strip()}")
