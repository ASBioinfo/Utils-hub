import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

check1={}

with open(input_file,"r") as file:

        for line in file:
                csk=line.strip().split()
                for col in csk:
                        check1[col]=line.strip()



input_file1=sys.argv[2]

with open(input_file1,"r") as file1:

        for line1 in file1:
                line1=line1.strip()
                if line1 in check1:
                        print (f"{line1}\t{check1[line1]}")

                else:
                        print (f"{line1}\tNot_found")