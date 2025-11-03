import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)


def overlap_percentage(interval1, interval2):
    intersection = max(0, min(interval1[1], interval2[1]) - max(interval1[0], interval2[0]))
    union = max(interval1[1], interval2[1]) - min(interval1[0], interval2[0])
    return (intersection / union) * 100 if union > 0 else 0


input_file=sys.argv[1]
with open (input_file,"r") as file:
	file1_data = [line.strip().split() for line in file]



input_file2=sys.argv[2]
with open (input_file2,"r") as file2:
	file2_data = [line1.strip().split() for line1 in file2]

for entry1 in file1_data:
    for entry2 in file2_data:
        if entry1[0] == entry2[0]:
            interval1 = (int(entry1[1]), int(entry1[2]))
            interval2 = (int(entry2[1]), int(entry2[2]))
            if is_overlap(interval1, interval2):
                percentage = overlap_percentage(interval1, interval2)
                print(f"Overlap {entry1}{entry2}, Overlap Percentage: {percentage:.2f}%")