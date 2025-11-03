import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

input_file_1 =sys.argv[1]
input_file_2 =sys.argv[2]


replacement_dict = {}
with open(input_file_2, 'r') as file2:
    for line in file2:
        key, value = line.strip().split(',')
        replacement_dict[key] = value

with open(input_file_1, 'r') as file1:
    for line in file1:
        parts = line.strip().split(',')
        if len(parts) == 2:
            key = parts[0]
            replacement = replacement_dict.get(key, parts[1])
            print(f"{key},{replacement}")
