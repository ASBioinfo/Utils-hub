import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)


input1=sys.argv[1]

with open (input1,'r') as file1:
	for line in file1:
		line=line.strip().split('\t')
		csk= "\t".join(line)

		if line[1] == "No_QTL_enriched_found" or line[2]=="No pathway enriched":
			pass

		else:
			print (f"esearch -db pubmed -query \"{line[0]} [GENE] AND cattle [ORGN]\" | esummary -format docsum | xtract -pattern DocumentSummary -element Title|awk '{{print \"{csk}\\t\"$0}}' >{line[0]}_BP_pub") 