import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

string=[]

with open(input_file,"r") as file:

        for line in file:
                line=line.strip()
                string.append(line)
                #csk=line.split(",")[0]

                #if not csk.startswith ("baseMean"):
                        #string.append(csk)


input_file1=sys.argv[2]

with open(input_file1,"r") as file1:

        for line1 in file1:
                line1=line1.strip()

                if line1.startswith("#") and not line1.startswith("##s"):
                        print(f"{line1}")

                mi=line1.split("\t")[0]
                        
                if mi in string:
                       print(f"{line1}")