#!usr/bin/perl -w
open(INFILE, "Interacted_patch_casp7_257-300_blastp_output_Sbjct_edit");
open(INFILE_1, "Interacted_patch_casp7_257-300_blastp_output_query_edit");
open(OUTFILE,  ">>Interacted_patch_casp7_257-300_blastp_output_Sbjct_query_edit");
while(@array = <INFILE>)
{
  @my_array = @array;
}
while(@array_1 = <INFILE_1>)
{
  @my_array_1 = @array_1;
}
for($k = 0; $k < @my_array; $k++)
{
  if($my_array[$k] =~ /^>/)
  { 
    @line_array = split(/\|/, $my_array[$k]);
    for($i = 0; $i < @my_array_1; $i++)
      {
        if($my_array_1[$i] =~ /$line_array[1]/)
         {       
           print OUTFILE ($my_array[$k]);
           print OUTFILE ("  **   * **   *  *             *  ***** **  \n");
           print OUTFILE ("EIMQILTRVNDRVARHFESQSDDPHFHEKKQIPCVVSMLTKELY\n");
           print OUTFILE ($my_array_1[$i + 1]);
           print OUTFILE ($my_array[$k + 1]);
           last;
         }
      }
  }
}   
    
