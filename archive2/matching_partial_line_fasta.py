import re
import sys

query_file=sys.argv[1]
reference_file=sys.argv[2]


with open(query_file, 'r') as f:
    query_lines = f.readlines()
    print(query_lines)


with open(reference_file, 'r') as f:
    reference_lines = f.readlines()


for query_line in query_lines:
    query_line = query_line.strip()


    for reference_line in reference_lines:
        reference_line = reference_line.strip()
        #print(reference_line)


        if re.search(query_line, reference_line):
            #print(reference_line)




query_file.close()
reference_file.close()