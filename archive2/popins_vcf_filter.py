import sys
import re

def contigs_file(input1):
    contig = {}
    with open(input1, "r") as file1:
        for line in file1:
            mi, csk = line.strip().split()
            contig[mi] = int(csk)
    return contig

def vcf_code(input2):
    final_positions = {}
    with open(input2, "r") as file2:
        for line1 in file2:
            if line1.startswith("#"):
                continue
            parts = line1.strip().split()
            contig_name = re.search(r'[\]\[](contig_\d+)[rf]?', parts[4])
            final_name = contig_name.group(1) if contig_name else None
            position = re.search(r'[:\[](\d+)[\]\[]', parts[4])
            final_position = position.group(1) if position else None
            if final_name and final_position:  
                final_positions[final_name] = final_position
    return final_positions

def main_code(final_positions, contig, vcffile):
    with open(vcffile, "r") as input_file:
        for line in input_file:
            if line.startswith("#"):
                continue
            parts = line.strip().split()
            current_chr_name = parts[0]
            current_final_name = re.search(r'[\]\[](contig_\d+)[rf]?', parts[4]).group(1)
            current_chr_pos = int(parts[1])

            if current_final_name in final_positions:
                final_position = final_positions[current_final_name]
                contig_length = contig.get(current_final_name)
                if contig_length is not None:
                    if abs(current_chr_pos - int(final_position)) <= 2000 and abs(int(final_position) - contig_length) <= 500:
                        print(f"{current_chr_name}\t{current_chr_pos}\t{current_final_name}\t{final_position}")

if __name__ == "__main__":
    contigfile = sys.argv[1]
    vcffile = sys.argv[2]

    contig = contigs_file(contigfile)
    final_positions = vcf_code(vcffile)
    main_code(final_positions, contig, vcffile)

