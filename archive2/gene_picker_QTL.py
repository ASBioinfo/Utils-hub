import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file_1 =sys.argv[1]
input_file_2 =sys.argv[2]

mi=[]

with open(input_file_1, 'r') as file1:
    for line in file1:
        if line.startswith("Chr"):
            line=line.strip().split("\t")
            mi.append(line[:4])


with open(input_file_2, 'r') as file2:
    for line2 in file2:
        if not line2.startswith("#"):

            line2=line2.strip().split("\t")
            if line2[2] == "gene":
                gene_start=int(line2[3])
                gene_end=int(line2[4])

                for csk in mi:
                    if csk[0]==line2[0]:
                        mi_start=int(csk[1])
                        mi_end=int(csk[2])

                        if mi_start <= gene_start <= mi_end or mi_start <= gene_end <= mi_end:
                            rr='\t'.join(line2)
                            print(f"{rr}\t{csk[0]}\t{csk[1]}\t{csk[2]}\t{csk[3]}")
                            

                        elif gene_start <=mi_start and gene_end >=mi_end:
                            rr='\t'.join(line2)
                            print(f"{rr}\t{csk[0]}\t{csk[1]}\t{csk[2]}\t{csk[3]}")