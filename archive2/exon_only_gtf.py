import sys
import re
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

chk1=r"protein_coding"
chk2=r"pseudogene"
keep=rf'{chk1}|{chk2}'

with open (input_file,"r") as file:
        seq=False
        for line in file:
                line=line.strip()

                csk=line.split("\t")

                if line.startswith("#"):
                        print (line)

                elif (csk[2]=="gene"):
                        if re.search(keep,line):
                                seq=True
                                print (line)

                        else:
                                seq=False       

                elif seq:
                        print (line)