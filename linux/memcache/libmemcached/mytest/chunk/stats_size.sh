

#       -q seconds   after EOF on stdin, wait the specified number of seconds and then quit. If seconds is negative, wait forever.

for ((i = 11211; i < 11212; i++))
do
	echo  -ne "port:$i:  "
	echo "stats sizes" |nc 127.0.0.1 ${i} -q1
done

