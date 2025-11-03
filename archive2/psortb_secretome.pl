#!/use/bin/perl

open(FILE,"$ARGV[0]");
while($line=<FILE>) {
chomp $line;

&FIND_GENE($line);


}


sub FIND_GENE {

open(IN,"$ARGV[1]");
while($in=<IN>) {
chomp $in;
@nani=split(/\s+/,$in);

if($nani[0] eq $_[0]){ print "$nani[0]\t$nani[5]\n";}
}
close(IN);
return;

}
