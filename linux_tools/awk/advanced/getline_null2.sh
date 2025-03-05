#! /bin/sh
awk '{
	original=$0;
	print "NF\t",NF,"\tNR\t",NR,"\tFNR\t",FNR,"\t$0\t",$0;
    code=getline;
	if(code!=0){
		print "NF\t",NF,"\tNR\t",NR,"\tFNR\t",FNR,"\t$0\t",$0;
	}
	print "\n\n"
}' line
