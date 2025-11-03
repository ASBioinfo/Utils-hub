import sys

from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

def calculate_percentage(csk, value_count):
    return (csk / value_count) * 100 if value_count > 0 else 0

input_file_1 = sys.argv[1]
input_file_2 = sys.argv[2]

with open(input_file_1, 'r') as file1:
    for line in file1:
        chromosome, start, end = line.strip().split(",")
        start, end = int(start), int(end)
        range_count = 0
        csk_count = 0

        with open(input_file_2, 'r') as file2:
            for line2 in file2:
                chrom2, value, label = line2.strip().split(",")
                value = int(value)

                if chromosome == chrom2 and start <= value <= end:
                    range_count += 1
                    if label in ['HIGH', 'MODERATE']:
                        csk_count += 1

        percentage = calculate_percentage(csk_count, range_count)
        print(f'{chromosome},{start},{end},{percentage:.2f}')
