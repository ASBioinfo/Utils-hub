import os
import sys
f=open("list.txt","r")
l=(f.read())
a=l.split()
m=iter(a)
os.mkdir("analysis")
#os.chdir("analysis")
for x,y in zip(m,m):
	k=x.find('.fastq')
	j=y.find('.fastq')
	os.mkdir(x[0:3])
	print('fastp --in1',os.path.abspath(x),'--in2',os.path.abspath(y),'--out1',os.getcwd()+'/analysis/'+x[0:3]+"/"+\
		x[:k]+'_trim_R1'+x[k:],'--out2',os.getcwd()+'/analysis/'+x[0:3]+"/"+y[:j]+'_trim_R2'+y[j:],'--adapter_fasta',\
		os.getcwd()+'/adapter_seq.fa --thread 16 -p --overrepresentation_analysis -l 50 -q 20 -u 20 -h',\
	    os.getcwd()+'/analysis/'+x[0:3]+'/'+x[0:3]+'_report.html -j',os.getcwd()+'/analysis/'+x[0:3]+'/'+x[0:3]+'_report.json -R',\
		os.getcwd()+'/analysis/'+x[0:3]+'/'+x[0:3]+'_report','--trim_front1 2 --trim_tail1 5 --trim_front2 2 --trim_tail2 5 --dont_overwrite \n \n')

