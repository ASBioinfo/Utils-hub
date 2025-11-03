import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file_1 =sys.argv[1]


with open(input_file_1, 'r') as infile:
    lines = infile.readlines()


header = lines[0].split()
column_indices = {header[i]: i for i in range(1, len(header))}

for i in range(1, len(lines)):
    parts = lines[i].split()
    contig_ID = parts[0]
    
    for j in range(1, len(parts)):
        column_name = header[j]
        if contig_ID.find(column_name) != -1:
            parts[column_indices[column_name]] = '1'

    lines[i] = '\t'.join(parts) + '\n'

for line in lines:
    print(line, end='')