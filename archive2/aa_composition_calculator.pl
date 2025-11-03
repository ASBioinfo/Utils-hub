#!usr/bin/perl -w
open (INFILE, "Interacted_patch_casp7_257-300_blastp_output_Sbjct_edit");
open (INFILE_1, "caspase-7");
open (OUTFILE, ">>Interacted_patch_casp7_257-300_blastp_output_Sbjct_edit_aa_composition");
$npol_ali_aa = "GAPVLIM";
$ar_aa = "FYW";
$pol_unchrg_aa = "STCNQ";
$pos_chrg_aa = "KRH";
$neg_chrg_aa = "DE";
while(@array = <INFILE>)
{
  @my_array = @array;
}
while(@array_1 = <INFILE_1>)
{
  @my_array_1 = @array_1;
}
@seq_name = grep(/^>/, @my_array_1);
foreach $line (@my_array)
{
  if($line =~ /^>/)
   {
     @line_array = split(/\|/, $line);
     foreach $seqline (@seq_name)
      {
        if($seqline =~ /$line_array[1]/)
         {
           $seqline =~ s/\s*\n$//;
           print OUTFILE ($seqline,"\t");
           last;
         }
      }
   }
  else
   {
     $line =~ s/\s*\n$//;
     @seq_array = split("", $line);
     $npol_ali_aa_num = $ar_aa_num = $pol_unchrg_aa_num = $pos_chrg_aa_num = $neg_chrg_aa_num = 0;
     foreach $aa (@seq_array)
      {
         if ($aa eq "-")
          {
            next;
          }
         if($npol_ali_aa =~ $aa)
          {
            $npol_ali_aa_num = $npol_ali_aa_num + 1;
          }
         if($ar_aa =~ $aa)
          {
            $ar_aa_num = $ar_aa_num + 1;
          }
         if($pol_unchrg_aa =~ $aa)
          {
            $pol_unchrg_aa_num = $pol_unchrg_aa_num + 1;
          }
         if($pos_chrg_aa =~ $aa)
          {
            $pos_chrg_aa_num = $pos_chrg_aa_num + 1;
          }
         if($neg_chrg_aa =~ $aa)
          {
            $neg_chrg_aa_num = $neg_chrg_aa_num + 1;
          }
      }
      $seq_len = $npol_ali_aa_num + $ar_aa_num + $pol_unchrg_aa_num + $pos_chrg_aa_num + $neg_chrg_aa_num;
      $npol_ali_aa_perc = ($npol_ali_aa_num * 100)/$seq_len;
      $ar_aa_perc = ($ar_aa_num * 100)/$seq_len;
      $pol_unchrg_aa_perc = ($pol_unchrg_aa_num * 100)/$seq_len;
      $pos_chrg_aa_perc = ($pos_chrg_aa_num * 100)/$seq_len;
      $neg_chrg_aa_perc = ($neg_chrg_aa_num * 100)/$seq_len;
      print OUTFILE ($npol_ali_aa_perc,"\t",$ar_aa_perc,"\t",$pol_unchrg_aa_perc,"\t",$pos_chrg_aa_perc,"\t",$neg_chrg_aa_perc,"\n");
   }
} 
close(INFILE);
close(OUTFILE);

           
        
