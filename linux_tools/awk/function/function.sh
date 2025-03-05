#!/bin/bash
awk '
function myprint(num, local)
{  
	if(i==0){
		if(local==null)
		    print "local variable initilized to\t",local;
		local=99;
		print "after assign local variable is\t",local;
		++i;
	}
	printf "%6.3g\n", num
}
$3 > 0 { myprint($3) }
' data
