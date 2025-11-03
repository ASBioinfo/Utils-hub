import sys

def gc_content (seq):

	try:
		gc_count=seq.count('G' or 'g')+seq.count('C' or 'c')
		return (gc_count/len(seq))*100

	except ZeroDivisionError:
		return 0

file=sys.argv[1]
#seq= ""
with open (file)as line:
	for i in line:
		if i.startswith(">"):
			header=i.strip()
			seq= ""

		else:
			seq +=seq.strip()

	print (header)
	print (gc_content (seq))
