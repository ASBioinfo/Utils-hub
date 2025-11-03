!#/usr/bin/perl						#usage:

open(FILE,"$ARGV[0]");   
			

while (my $line=<FILE>){

chomp($line);
if ($line=~/^>/) {$name= $line; next; }

my $count1=($line=~tr/N/N/);
my $count2=($line=~tr/ATGCatgc/ATGCatgc/);



if ($count2==0) {next;}
if ($count1==0) { print "$name\n$line\n";next;	}


@kkr=split(//,$line);
my $len=@kkr;
for ($i=0;$i<=$len; $i++){
my $test=pop @kkr;
if ($test ne "N") { push @kkr, $test;last; }


}

for ($i=0;$i<=$len; $i++){
my $test=shift @kkr;
if ($test ne "N") { unshift @kkr, $test;last; }


}


print "$name\n";
print @kkr;
print "\n";




}

close(FILE);


