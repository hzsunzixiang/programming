#! /bin/sh
awk '{
	 if(NF != 2) {
		printf("\nline %d skipped: doesnt have 2 fields\n", FNR) > "/dev/stderr";
		next
	}
	print "NF\t",NF,"\tNR\t",NR,"\tFNR\t",FNR,"\t$0\t",$0;
	next;
	print "we will never see here"
}' line1
