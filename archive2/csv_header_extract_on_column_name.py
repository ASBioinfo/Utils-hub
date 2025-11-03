import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)


def extract_columns(input_file, column_names, delimiter=','):
    with open(input_file, 'r') as file1:
        headers = file1.readline().strip().split(delimiter)
        column_indices = []
        for header in column_names:
            header = header.strip()
            if header in headers:
                column_indices.append(headers.index(header))
            else:
                pass
        
        extracted_data = []
        extracted_data.append([headers[i] for i in column_indices])
            
        for line in file1:
            columns = line.strip().split(delimiter)
            selected_columns = [columns[i] for i in column_indices]
            extracted_data.append(selected_columns)
    
    return extracted_data


input_file = sys.argv[1]
columns_str = sys.argv[2]
with open (columns_str,'r') as file2:
    for line2 in file2:
        column_names = line2.strip().split(',')

extracted_data = extract_columns(input_file, column_names)

for row in extracted_data:
    print(','.join(row))