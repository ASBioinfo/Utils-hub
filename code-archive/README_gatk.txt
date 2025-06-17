**********GATK for variant calling************{please use GATK 4.6.2.1 or above}

1. Run Haplotype caller for each of your bams obtained from previous steps: (trim-align-sam-bam)

	/home/niab/app/gatk/gatk --java-options "-Xmx16g -XX:ParallelGCThreads=40" HaplotypeCaller -R /home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna -I /home/niab/ashish/bos_indicus/analysis/out/bachaur5/bachaur5.bam -O bachaur5.bam.vcf.gz -ERC GVCF

2. Then, combine all your gvcf files:

	/home/niab/app/gatk/gatk --java-options "-Xmx96g -Xms96g" CombineGVCFs -R /home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna --variant output1.g.vcf.gz --variant output2.g.vcf.gz --variant output3.g.vcf.gz -O combined.g.vcf.gz

3. Finally, perform joint-genotyping on the combined gvcf:

	/home/niab/app/gatk/gatk --java-options "-Xmx96g -Xms96g" GenotypeGVCFs -R $reference -V combined.g.vcf.gz -O final.vcf.gz
***********Filtering************{unpigz vcf.gz with gunzip}

4.Filter the obtained vcf to obtain the SNPs only.
 
	/home/niab/app/gatk/gatk SelectVariants -R /home/niab/ashish/bos_indicus/brahman_reference/brahman_reference.fna -V finalout.vcf --select-type-to-include SNP -O finalsnp.vcf
5. Filter on the basis of quality score (>30). using vcffilter #### NOT NEEDED AS DEFAULT MIN. QUAL IN GATK >30 #####

	vcffilter -f  "QUAL > 30" finalsnp.vcf > finalsnp_30.vcf 

