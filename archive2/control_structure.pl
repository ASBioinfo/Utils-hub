#!/usr/bin/perl
@food  = ("apples", "pears", "eels");
#@music = ("whistle", "flute");
foreach $morsel (@food)		# Visit each item in turn
				# and call it $morsel
{
	print "$morsel\n";	# Print the item
	print "Yum yum\n";	# That was nice
}
