#! /usr/bin/awk -f
BEGIN{
	"date"|getline;# execute date in shell  save into $0
	print "Today is",$2,$3>"today_result2";
	print "ID Number    Arrival Time">"today_result2"; # awk open the file 
	print "=========================">"today_result2";
	close("today_result2");
}

{
	printf("%s\t\t%s\n",$1,$2)|"sort -k 1 >> today_result2"; #shell open the file
}

