import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)									
#python gene_mapping_nr_QTL.py final_ARS_UCD1.2_gene_mapped gene_mapped gene_set_non_redundant


print (f"#b_indicus_gene_id\tb_taurus_gene_id\tQTL_trait")

input_file_1 =sys.argv[1]
mi={}

with open(input_file_1, 'r') as file1:
	for line in file1:
		key,value=line.strip().split("\t")
		if key in mi:
			mi[key].append(value)

		else:
			mi[key]=[value]


input_file_2 =sys.argv[2]
rr={}
with open(input_file_2, 'r') as file2:
	for line2 in file2:
		if not line2.startswith("#"):
			dc=line2.strip().split("\t")
			key=dc[1].split("gene=")[1]
			value=dc[0].split("gene=")[1]
			if key in rr:
				rr[key].append(value)

			else:
				rr[key]=[value]



input_file_3 =sys.argv[3]
with open(input_file_3, 'r') as file3:
	for line3 in file3:
		line3=line3.strip()

		check=False

		for key_rr, value_rr in rr.items():
			if line3 in value_rr:
				if key_rr in mi:
					print (f"{line3}\t{key_rr}\t{' ;'.join(mi[key_rr])}")

				else:
					print (f"{line3}\t{key_rr}\tNo_QTL_enriched_found")

				check=True
				break

		if not check:
			print (f"{line3}\tNot mapped in ARS-UCD1.2")