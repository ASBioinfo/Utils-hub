import sys
from signal import signal,SIGPIPE,SIG_DFL
signal(SIGPIPE,SIG_DFL)

def length_count(input1):
	contig_name= ""
	contig_length= 0
	contig_size=[]
	with open (input1,'r') as file1:
		for line in file1:
			line=line.strip()
			if line.startswith(">"):
				if contig_name:
					print(f"{contig_name}\tlength={contig_length}")
					contig_size.append(contig_length)
					contig_length= 0
				contig_name=line
			
			else:
				contig_length+=len(line)

		if contig_name:
			print(f"{contig_name}\tlength={contig_length}")

	contig_size.sort(reverse=True)
	largest=max(contig_size)
	smallest=min(contig_size)
	total=sum(contig_size)
	N50=total*0.5
	start_N50=0
	start_L50=0
	for i in contig_size:
		start_N50+=i
		start_L50+=1
		if start_N50 >=N50:
			Final_N50=i
			break 
	
	N90=total*0.9
	start_N90=0
	start_L90=0
	for i in contig_size:
		start_N90+=i
		start_L90+=1
		if start_N90 >=N90:
			Final_N90=i
			break

	return largest,smallest,Final_N50,start_L50,Final_N90,start_L90

def GC_percent(input1):
	A,T,G,C,N,U,length,contig_number=0,0,0,0,0,0,0,0
	with open (input1,"r") as file2:
		for line in file2:
			line=line.strip()
			if line.startswith(">"):
				contig_number+=1
				pass

			else:
				length+=len(line)
				for i in line:
					if i=="A" or i=="a":
						A+=1
					elif i=="T" or i=="t":
						T+=1
					elif i=="G" or i=="g":
						G+=1
					elif i=="C" or i=="c":
						C+=1
					elif i=="N" or i=="n":
						N+=1
					elif i=="U" or i=="u":
						U+=1

	GC_perc=float((G+C)/length)*100
	GC_perc_final="{:.2f}".format(GC_perc)
	return  A,T,G,C,N,U,length,GC_perc_final,contig_number


input1=sys.argv[1]
print (f"#Start of Sequence:")
largest,smallest,Final_N50,start_L50,Final_N90,start_L90=length_count(input1)
A,T,G,C,N,U,length,GC_perc_final,contig_number=GC_percent(input1)
print (f"\n#Statistics of FASTA file :\nTotal Sequences = {contig_number}\nTotal Bases = {length} bp\nLargest Sequences = {largest} bp")
print (f"Smallest Sequences = {smallest} bp\nGC % = {GC_perc_final}\nN50 = {Final_N50} bp\nN90 = {Final_N90} bp\nL50 = {start_L50}\nL90 = {start_L90}")
print (f"A = {A}\nT = {T}\nG = {G}\nC = {C}\nN = {N}\nU = {U}")