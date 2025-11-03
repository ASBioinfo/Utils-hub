query="/home/livestock/syri/LGP04/ragtag_output/LGP04_ragtag_chr_only.fasta"
out_prefix="BrhmanxLGP_04"
ref="/home/livestock/syri/ref_Brahman/GCF_003369695.1_UOA_Brahman_1_genomic_chr_only.fna.masked"
echo "sarwar $query"
input_file=$(basename $query)
query1="$input_file.masked"
echo "azam $query1"
rm -r syri_analysis
mkdir syri_analysis
cd syri_analysis
RepeatMasker -pa 30 -q -dir . -species cow $query
nucmer --maxmatch -c 500 -b 500 -l 100 -t 30 $ref $query1
delta-filter -m -i 90 -l 100 out.delta > out_m_i90_l100.delta
show-coords -THrd out_m_i90_l100.delta > out_m_i90_l100.coords
mkdir syri
cd syri
syri -c ../out_m_i90_l100.coords -r $ref -q ../$query1 -d ../out_m_i90_l100.delta --nc 30 --prefix $out_prefix --all

