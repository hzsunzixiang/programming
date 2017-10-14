#!/bin/sh


#awk '{if($0~/200 OK/&&NF==15) {print $2"\t" $(NF-1)"\t" }}' $1|sort>1.txt
#awk '{ print $2"\t" $1|"cut -d: -f 1,2"  }' 1.txt>2.txt
#awk '{print $2"\t"$1}' 2.txt>3.txt
#awk '{a[$1]+=$2}  END{for(i in a) print i"\t" a[i]/1024/60}' 3.txt |sort>traffic.dat

awk '{if($0~/200 OK/&&NF==15) {print $2"\t" $(NF-1)"\t" }}' $1|sort|
awk '{ print $2"\t" $1|"cut -d: -f 1,2"  }'|
awk '{print $2"\t"$1}'|
awk '{a[$1]+=$2}  END{for(i in a) print i"\t" a[i]/1024/60}' 3.txt |sort>traffic.dat




awk '{if($0~/200 OK/&&NF==15) {print $2|"cut -d: -f 1,2"}}' $1 |sort|

uniq  -c|awk '{print $2"\t"$1/60}'>tps.dat

#sort  -n  ${2}1.txt>${2}2.txt
#uniq ${2}2.txt>${2}3.txt

