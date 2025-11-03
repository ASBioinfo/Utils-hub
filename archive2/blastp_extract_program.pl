#!usr/bin/perl -w
print("data sreeining from blast\n");
open(INFILE, "blaseEC.cow");
open(OUTFILE, ">>test.txt");
while(@array = <INFILE>)
{
  $len_array = @array;
  @my_array = @array;
  print OUTFILE (("Total line in given text file is: $len_array\n"));
}
#push(@my_array, "BLASTP 2.2.24");
$count = 0;
$temp = 0;
$new_temp = 0;
while($count < $len_array)
{
  if($my_array[$count] =~ /BLASTP/)
    {
      $blastn[$temp] = $count;
      $temp = $temp + 1;
    }
  $count = $count + 1;
}
$num_blastn = @blastn;
print OUTFILE (("total number of BLASTN in given is: $num_blastn\n"));   
#print OUTFILE (("blastn array is: @blastn\n")); 
while($new_temp < $num_blastn - 1)
{
  $new_temp_1 = $blastn[$new_temp];
  $new_temp_2 = $blastn[$new_temp + 1];
  while($new_temp_1 < $new_temp_2)
      {
         if($my_array[$new_temp_1] =~ /Query  /)
             {
                print OUTFILE ($my_array[$new_temp_1]);
             }
          if($my_array[$new_temp_1] =~ /^>/)
             {
               $my_array[$new_temp_1] =~ s/\s+$//;                
               print OUTFILE ("$my_array[$new_temp_1]|");
             }
          if($my_array[$new_temp_1] =~ /Sbjct:/)
             {
                chop($my_array[$new_temp_1]);
                @sbjct = split(" ", $my_array[$new_temp_1]);
                print OUTFILE ("$sbjct[1]-$sbjct[3]\n");
                print OUTFILE ("$sbjct[2]\n");     
             } 
      $new_temp_1 = $new_temp_1 + 1;
      }
$new_temp = $new_temp + 1; 
} 
            
                  
    
     
