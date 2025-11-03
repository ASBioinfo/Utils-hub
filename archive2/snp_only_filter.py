import sys
import re
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

chk1=r"type=SNP"
chk2=r"type=INS"
keep=rf'{chk1}|{chk2}'

with open (input_file,"r") as file:
 
        for line in file:
                line=line.strip()
                if line.startswith("#"):
                        print (line.strip())

                else:
                        if line.startswith("NC"):
                                if re.search(keep,line):
                                        print(line.strip())

                        else:
                                break