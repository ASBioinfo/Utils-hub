import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]
#print (f"query id,subject id,evalue,bit score,% identity,alignment length,subject titles,q. start,q. end,query length,s. start,s. end,subject length,identical,mismatches,gap opens,gaps,% query coverage per subject,% query coverage per hsp")

check2=""
with open (input1,'r') as file1:
	for line in file1:

		if line.startswith("#"):
			pass

		else:
			csk=line.strip().split("\t")
			check1=float(((abs(float(csk[11])-float(csk[10]))+1)/float(csk[12]))*100)
			check1=round(check1,3)
			#print (f"{line.strip()}\t{check1}")
			if (check1>=80):
				if float(csk[4])>=90:
					if csk[0] != check2:
						print (f"{csk[1]}")
						check2=csk[0]
