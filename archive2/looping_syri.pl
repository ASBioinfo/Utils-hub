#!/usr/bin/perl                                         

open(FILE,"$ARGV[0]");   
                        

@sample=<FILE>;



for ($i=0;$i<=$#sample;$i++) {

$ref=@sample[$i];
@ref_name= split(/\//,$ref);

@ref_name1=split(/_/,$ref_name[$#$ref_name]);
#print "$ref_name1[0]\n";
for ($j=$i+1;$j<=$#sample;$j++) {

$query=@sample[$j];
@qry_name= split(/\//,$query);
@qry_name1=split(/_/,$qry_name[$#$qry_name]);
#print "$qry_name1[0]\n";
$out=$ref_name1[0]."x".$qry_name1[0];
#print "$out\n";
print "ref=$ref\n";
print "query=$query\n";
print "mkdir $out\n";
print "cd $out\n";
print "nucmer --maxmatch -c 500 -b 500 -l 100 -t 30 \$ref \$query\n";
print "delta-filter -m -i 90 -l 100 out.delta > out_m_i90_l100.delta\n";
print "show-coords -THrd out_m_i90_l100.delta > out_m_i90_l100.coords\n";
print "syri -c out_m_i90_l100.coords -r \$ref -q \$query -d out_m_i90_l100.delta --nc 30 --prefix $out --all\n";
print "cd ..\n\n\n";

}







}
	


