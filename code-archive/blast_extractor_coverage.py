import sys
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE, SIG_DFL)

input1 = sys.argv[1]
printed_ids = set()  
#print (f"query id,subject id,evalue,bit score,% identity,alignment length,subject titles,q. start,q. end,query length,s. start,s. end,subject length,identical,mismatches,gap opens,gaps,% query coverage per subject,% query coverage per hsp")
with open(input1, 'r') as file1:
    for line in file1:
        if line.startswith("#"):
            continue
        
        csk = line.strip().split("\t")
        try:
            # Calculate coverage
            check1 = float(((abs(float(csk[11]) - float(csk[10])) + 1) / float(csk[12])) * 100)
            check1 = round(check1, 3)
            
            # Check coverage (>=80%) and identity (>=90%)
            if check1 >= 80 and float(csk[4]) >= 90:
                if csk[1] not in printed_ids:
                    print(csk[1])
                    printed_ids.add(csk[1])  
        except (IndexError, ValueError) as e:
            continue
