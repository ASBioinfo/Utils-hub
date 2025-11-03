import sys
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)

file1=sys.argv[1]
file2=sys.argv[2]

def add_50bp(seq1, seq2):
	if i.startswith (">"):
		header=i.strip()
		return

    match = False
    for i in range(len(seq2) - len(seq1) + 1):
        if seq2[i:i+len(seq1)] == seq1:
            match = True
            break
    if match:
        return seq2[i-50:i+len(seq1)+50]
    else:
        return None

with open("file1", "r") as f1, open("file2", "r") as f2:
    seq1 = f1.read().strip()
    seq2 = f2.read().strip()
    result = add_50bp(seq1, seq2)
    if result:
        print(result)
    else:
        print("No match found")