import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file_1 =sys.argv[1]
with open(input_file_1, 'r') as file1:

	mi={}

	for line in file1:
		key,value=line.strip().split("\t")
		if key in mi:
			mi[key].append(value)

		else:
			mi[key]=[value]

	csk = {key: ' ;'.join(values) for key, values in mi.items()}

	for key, values in csk.items():
		print(f"{key}\t{values}")