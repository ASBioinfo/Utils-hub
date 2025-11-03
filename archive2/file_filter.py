import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input1=sys.argv[1]

protein_ids = {}

with open(input1, 'r') as file:
    for line in file:
        csk=line.strip().split('\t')
        protein=csk[0] 
        protein_id=csk[1]
        if protein not in protein_ids:
            protein_ids[protein] = protein_id

for protein, protein_id in protein_ids.items():
    print(f"{protein}\t{protein_id}")
