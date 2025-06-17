*************Freebayes variant calling************

1.Call the variant using freebyes parallel
	 /home/niab/app/freebayes/scripts/freebayes-parallel target.regions 40 --fasta-reference /home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna --use-best-n-alleles 4 --bam-list bamlist.txt > snp.vcf
#######bamlist contains all fullpaths to the bam files to be assembled##########

******** Filtering**********

9. Filtering the data by means of quality score 30 and obtaining true-SNP using awk : ##vcffilter###
                vcffilter -f  "QUAL > 30" snp.vcf | awk '/TYPE=snp/ {print $0}' > snp_q30_true.vcf
10. Take out the different types of data -->  sorted out --> counted the no. of each type.
                awk '{print $8}' snp_30.vcf |awk -F ";" '{print $41}'|sort |uniq -c
11. Count the types individually
                awk '/TYPE=****/ {print $0}' uniqsort_snp.vcf | awk '{sum+=$1} END {print sum}'    
 ###### ***** means snp/del/ins/complex ######
