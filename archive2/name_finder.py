import sys
import re
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

string=[]

with open(input_file,"r") as file:

        for line in file:
                line=line.strip()


                if not line.startswith ("#"):
                        string.append(re.escape(line))


input_file1=sys.argv[2]

with open(input_file1,"r") as file1:
        #header=next(file1).strip()
        #print(header)

        for line1 in file1:
                line1=line1.strip()
                for pattern in string:
                        if re.search(r'\b' + pattern + r'\b', line1):
                                print (line1)
                                break
                
