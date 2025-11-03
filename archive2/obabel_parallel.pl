#!/usr/bin/perl

open(FILE, "$ARGV[0]");     	#usage: perl autodock-vina-parellel.pl list.txt 
				# list.txt is list of ligand molecules in pdbqt format

my @childs=();

my $maxproc=42;                 #define no of processor 
my $numproc=0;
while ($line=<FILE>) {

chomp $line;
#print "azam\t$line\n";

@basename= split (".smi",$line);

 #system "mkdir -p $basename[0]";


     if(($pid=fork()) == 0)
        {	#print "vina --config conf.txt --ligand $line --out $basename[0]/$basename[0]_out.pdbqt --log $basename[0]/$basename[0].log\n";
                               # print "obabel  -ismi $line -osdf -O $basename[0].sdf --gen3D\n";
                system("obabel  -ismi $line -osdf -O $basename[0].sdf --gen3D");
                 

                exit 0;
        }

        push(@childs, $pid);
        $numproc++;

        while($numproc >= $maxproc)
        {
                waitpid(shift(@childs), 0);
                $numproc--;
        }
}



while($k=shift(@childs))
{
        waitpid($k, 0);
}

warn "Docking finished\n check the files\n";




