!#/usr/bin/perl


open(FILE,"$ARGV[0]");

%hash_record="";


while ($line=<FILE>){

chomp $line;

my @car=split(/_/, $line);

    $name=$car[0]."_".$car[1]."_".$car[2];                  

$hash_record{$name}= $line;
#print"$name\n";
}

close(FILE);


open(FILE1,"$ARGV[1]");

%hash_score="";


while ($line1=<FILE1>){

chomp $line1;

my @car1=split(/\s+/, $line1);

    my $name1=$car1[0];                 
my $value=$car1[2]*100;
#print "$value\n";
$hash_score{$name1}= $value;

}

close(FILE1);

open(FILE2,"$ARGV[2]");

#%hash_score="";


while ($line2=<FILE2>){

chomp $line2;

my $score=$hash_score{$line2};

#print "azam $score\n";

my $record=$hash_record{$line2};

my @moh=split(/\s+/,$record);

$moh[12]=$score;

foreach $morsel(@moh){

print "$morsel\t";
}
print "\n";


}












