import sys
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE, SIG_DFL)

contig_info = {}
contig_types = {}

def update_contig_types(contig, types):
    if contig in contig_types:
        for t in types:
            type_name, type_count = t.split(':')
            contig_types[contig][type_name] = contig_types[contig].get(type_name, 0) + int(type_count)
    else:
        contig_types[contig] = {t.split(':')[0]: int(t.split(':')[1]) for t in types}

with open(sys.argv[1], 'r') as file1:
    contigs = [line.strip() for line in file1.readlines()]

with open(sys.argv[2], 'r') as file2:
    for line in file2:
        parts = line.strip().split()
        contig = parts[0]
        types = parts[1].split(';')
        
        update_contig_types(contig, types)

all_types = sorted(set(type for types in contig_types.values() for type in types.keys()))

print("\t" + ",".join(all_types))

for contig in contigs:
    type_presence = [contig_types.get(contig, {}).get(t, 0) for t in all_types]
    print(contig + "\t" + ",".join(map(str, type_presence)))