import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

#python ../script/gene_QTL_pathway.py gene_set_non_redundant final_QTL_analysis.txt cc_pathway_gene

def qtl_extract(input2):
	qtl={}
	with open (input2,'r') as file2:
		for line in file2:
			if line.startswith("#"):
				pass

			else:
				line=line.strip().split("\t")

				if len(line) ==3:
					key=line[0]
					value=line[2]
					qtl[key]=value

				else:
					key=line[0]
					value=line[1]
					qtl[key]=value

	return qtl

def pathway_extract(input3):
	pathways={}
	with open (input3,'r') as file3:
		for line in file3:
			pathway,genes=line.strip().split("\t")
			genes=[gene.strip() for gene in genes.split (",")]

			for gene in genes:
				if gene not in pathways:
					pathways[gene]=[]

				pathways[gene].append(pathway)

	return pathways

def gene_qtl_pathway(input1,qtl,pathways):

	with open (input1, 'r') as file1:
		for line1 in file1:
			line1=line1.strip()

			if line1 in qtl and line1 in pathways:
				qtl_value=qtl[line1]
				pathways_value=','.join(pathways[line1])

				print (f"{line1}\t{qtl_value}\t{pathways_value}")

			elif line1 in qtl and line1 not in pathways:
				qtl_value=qtl[line1]
				print (f"{line1}\t{qtl_value}\tNo pathway enriched")

			else:
				print (f"######AS######")


input1 = sys.argv[1]
input2 = sys.argv[2]
input3 = sys.argv[3]

qtl = qtl_extract(input2)
pathways = pathway_extract(input3)
gene_qtl_pathway(input1, qtl, pathways)