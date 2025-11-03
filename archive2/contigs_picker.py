import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file_1 =sys.argv[1]
input_file_2 =sys.argv[2]

with open(input_file_1, 'r') as file1:
    contigs = [line.strip() for line in file1.readlines()]


matrix = {}
with open(input_file_2, 'r') as file2:
    for line in file2:
        parts = line.strip().split()
        contig = parts[0]
        types = set(parts[1].split(';'))

        if contig not in matrix:
            matrix[contig] = set()

        matrix[contig] |= types


all_types = sorted(set(type for types in matrix.values() for type in types))


print("contig ", ",".join(all_types))


for contig in contigs:
    type_presence = [1 if t in matrix.get(contig, set()) else 0 for t in all_types]
    print(contig,",".join(map(str, type_presence)))