import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file=sys.argv[1]

string=[]

with open(input_file,"r") as file:

        for line in file:
                line=line.strip()

                csk=line.split(",")[0]

                if not csk.startswith ("baseMean"):
                        string.append(csk)


input_file1=sys.argv[2]

with open(input_file1,"r") as file1:
        header=next(file1).strip()
        print(header)

        for line1 in file1:
                line1=line1.strip()
                for pattern in string:
                        if ('"{}"'.format(pattern) in line1):
                                print(line1)
                                break
