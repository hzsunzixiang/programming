

echo "stats slabs"  |nc 127.0.0.1 11211 -q1  >slab.txt 
 
echo "stats slabs"  |nc 127.0.0.1 11211 -q1  |grep -e chunk_size  -e used_chunks  -e free_chunks > slab_size.txt
##       -q seconds   after EOF on stdin, wait the specified number of seconds and then quit. If seconds is negative, wait forever.
#
#for ((i = 11211; i < 11212; i++))
#do
#	echo  -ne "port:$i:  "
#	echo "stats" |nc 127.0.0.1 ${i} -q1
##echo "stats slabs" |nc 127.0.0.1 ${i} -q1
#done

