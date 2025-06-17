***********STEPS in VCF to Filtered genotyping table************
1. Filter the biallelic snps using bi_allelic_snp_selection_frm_freebayes_vcf.pl and snp table is made.(snp_30.vcf --> snptablefreebayes_bi.txt) & GATK also.
2. Take common snps between freebayes & GATK by comparing the haplotypes(chr ids)
	awk 'NR==FNR{seen[$1]=1; next} seen[$1]' snptablegatk_bi.txt snptablefreebayes_bi.txt  > commonG_F_snp.txt 
3. Transpose the table to filter on the basis of low quality breed reads using transpose.pl (commonG_F_snp.txt --> transpose_commonG_F_snp.txt)
4. filter on the basis of quality of SNPs (10%) ( Row wise) using  remove_missing_genotype.pl setting the parameter according to sample size.(transpose_commonG_F_snp.txt --> filteredbreed.txt 
4. Transpose the resulted matrix of step2 using  transpose.pl (filteredbreed.txt --> transpose_filteredbreed.txt
5. Filter on the basis of genotype quality (10%) of breeds from the transposed matrix using  remove_missing_genotype.pl setting the parameter according to sample size.(transpose_filteredbreed.txt --> filtergeno.txt)
6. Filter on the basis of MAF (5%) using maf.pl (filtergeno.txt --> maffiltered.txt)
7. Remove the #lines comprising the data of homologous only. (maffiltered.txt --> maffiltered_nohomo.txt)
8. Take out those SNPs from snp_30.vcf which are in our filtered matrix and created the final_filtered.vcf. 
	perl snp2vcf_filter.pl maffiltered_nohomo.txt snp_30.vcf >final_filtered.vcf  
9.Removed the fragments (^NW) using awk.
	awk '!/^NW/{print $0}' final_filtered.vcf > final_filtered_chr.vcf
###10. Filter on the basis of HWE (0.0001%) -----
 
 ########### snpEff ##############
1. Annotate the VCF files as 1,2,3,4 instead for the already given chr code using bcftools:
	bcftools annotate --rename-chrs mapforsnpeff.txt final_filtered_chr.vcf >vcfforsnpEff.vcf
2. Comparing and taking out the annotated files along with the data statistics file in html format. (-classic for v4.1 output) (#NO# -classic for v5.1 output)
	java -jar snpEff.jar -classic -v UOA_Brahman_1.99 /home/sarwar/ashish/vcfforsnpEff.vcf >/home/sarwar/ashish/snpEff_filtered_classic.vcf
2. Took out the SNPs in Exon :( make it a vcf file adding the lines starting with # )
	grep -e EXON -e EXON_DELETED -e NON_SYNONYMOUS_CODING -e SYNONYMOUS_CODING -e FRAME_SHIFT -e CODON_CHANGE -e CODON_INSERTION -e CODON_CHANGE_PLUS_CODON_INSERTION -e CODON_DELETION -e CODON_CHANGE_PLUS_CODON_DELETION -e STOP_GAINED -e SYNONYMOUS_STOP -e STOP_LOST -e RARE_AMINO_ACID snpEff_filtered_classic.vcf > exon_filtered2.vcf
########## PCA using plink2 #########
/home/sarwar/app/plink2_linux_x86_64/plink2 --vcf exon_filtered.vcf --allow-extra-chr --make-bed --pca --out /home/sarwar/ashish/plink2/result 
