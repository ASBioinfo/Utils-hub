import sys
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE, SIG_DFL)

input1 = sys.argv[1]
input2 = sys.argv[2]

check = {}

with open(input1, 'r') as file1:
    line_number = 0
    for line in file1:
        line_number += 1
        try:
            if not line.startswith("#"):
                csk = line.strip().split("\t")
                if csk[2] not in ["region", "cDNA_match"]:

                    if csk[2] == "gene" or csk[2] == "pseudogene":
                        rr = csk[8].split("Name=")
                        lsg = rr[1].split(";")[0]
                    else:
                        jj = csk[8].split("gene=")
                        kk = jj[1].split(";")[0]
                        lsg = kk

                    key = csk[0]
                    value1 = csk[2]
                    value2 = int(csk[3])
                    value3 = int(csk[4])
                    value4 = lsg

                    if key not in check:
                        check[key] = []
                    check[key].append((value1, value2, value3, value4))
        except IndexError as e:
            print(f"{line.strip()}")
            print("Error:", e)



with open(input2, 'r') as file2:
    for line2 in file2:
        mi = line2.strip().split("\t")
        kkr = mi[1]

        if kkr in check:
            region_start = int(mi[2])
            region_end = int(mi[3])
            
            found = False
            for entry in check[kkr]:
            	
                if (region_start <= entry[1] <= region_end) or (region_start <= entry[2] <= region_end):
                	print(f"{line2.strip()}\t{entry[0]}\t{entry[3]}")  
                	found = True
                	
            
            if not found:
                print(f"{line2.strip()}\tNot found")      			