#!usr/bin/perl -w 
open(INFILE, "Blast_result");
open(OUTFILE, ">>Acan_cast_AAL87229_blast");
print OUTFILE ("Query\n");
while(@array = <INFILE>)
{
  @my_array = @array;
}
foreach $line (@my_array)
{
  if($line =~ /Query/)
    {
      @line_array = split(/\s+/, $line);
      print OUTFILE (("$line_array[2]\n"));
    }
} 
  
