import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

#python genotype_matrix.py contig_list_super file_list.txt         (contig_list_super:contig_name_list ;file_list.txt:list with path for each file)

def read_file(filename):
    with open(filename, 'r') as file:
        return set(line.strip() for line in file)

def create_matrix(input_file1, input_file2):
    contigs = []
    with open(input_file1, 'r') as input_file1:
        contigs = [line.strip() for line in input_file1]

    with open(input_file2, 'r') as file_list:
        header = [file_path.split('/')[-1].split('.')[0] for file_path in file_list]
        matrix = {contig: [0] * len(header) for contig in contigs}
        file_list.seek(0)

        for i, file_path in enumerate(file_list):
            file_path = file_path.strip()
            file_contigs = read_file(file_path)
            for contig in contigs:
                matrix[contig][i] = 1 if contig in file_contigs else 0

    return matrix, header

if __name__ == "__main__":

    input_file1 = sys.argv[1]
    input_file2 = sys.argv[2]

    result_matrix, header = create_matrix(input_file1, input_file2)
    print("{}".format('contig_ID,'),end='')  
    print(','.join(header))

    for contig, presence_list in result_matrix.items():
        print("{}".format(contig),end=',')
        print(','.join(map(str, presence_list)))
