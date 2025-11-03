import sys

inputfile = sys.argv[1]
length = int(sys.argv[2])
l=""
#outfile = open(inputfile.split(".fasta")[0] + '_multi-line.fasta', 'w')

with open(inputfile, 'r') as f:
     for line in f:
        if line.startswith(">"):
                l=l+line
                l.strip()
        else:
                sequence = line.strip()
                while len(sequence) > 0:
                	l=l+sequence
                    sequence[:length]
                    sequence = sequence[length:]


print(l)