
#!/usr/bin/perl
use Cwd qw(abs_path);


#my $path= abs_path();
$path=$ARGV[0];
my @list=`ls $path`;
#print "@list\n"; 
#open (FILE, "$ARGV[0]");
#s@list=<FILE>; 
#print "@list\n"; 


foreach my $line (@list) {
chomp $line;

my $R1_basename="";
my $R2_basename="";



if($line=~/_R1\./){
			my @base_name3=split("_R1", $line );

			my $R1_basename=$base_name3[0];
			
							for ($i=0; $i<=$#list; $i++){
								$line1=$list[$i];
								chomp $line1;


								if($line1=~/_R2\./){ 
											my @base_name31=split("_R2", $line1 );
											my $R2_basename=$base_name31[0]; #print "$R2_base_name\n";
											if ($R1_basename eq $R2_basename){ print "$path/$line\t$path/$line1\n";  last; }

											}

										}

				
								
						}



				}


