import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)
from collections import defaultdict

def calculate_percentage(csk, value_count):
    return (csk / value_count) * 100 if value_count > 0 else 0

ranges = {}
csk_counts = defaultdict(int)

input_file_1 = sys.argv[1]
with open(input_file_1, 'r') as file1:
    for line in file1:
        chromosome, start, end = line.strip().split(",")
        key = (chromosome, int(start), int(end))
        ranges[key] = 0 

input_file_2 = sys.argv[2]
with open(input_file_2, 'r') as file2:
    for line2 in file2:
        chromosome, value, label = line2.strip().split(",")
        value = int(value)
        for (chromosome, start, end) in ranges.keys():
            if start <= value <= end:
                ranges[(chromosome, start, end)] += 1
                if label in ['HIGH', 'MODERATE']:
                    csk_counts[(chromosome, start, end)] += 1

for (chromosome, start, end), value_count in ranges.items():
    csk = csk_counts[(chromosome, start, end)]
    percentage = calculate_percentage(csk, value_count)
    print(f'{chromosome},{start},{end},{percentage:.2f}')
