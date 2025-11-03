import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

def merge_rows(input_file):
    merged_data = {}

    with open(input_file, 'r') as infile:
        for line in infile:
            columns = line.strip().split('\t')
            gene_id = columns[3]
            length = int(columns[2])
            if gene_id not in merged_data:
                merged_data[gene_id] = [columns[1], length, gene_id]
            else:
                merged_data[gene_id][1] += length

    for gene_id, merged_row in merged_data.items():
        print('\t'.join(map(str, merged_row)))

input_file = sys.argv[1]

merge_rows(input_file)