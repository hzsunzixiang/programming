#!/bin/bash
num_elements=100
num_iter=100
echo "random"
for mode in 0 1 2
do
    for ((i=0;i<$num_iter;++i))
        do gdb -x commands.gdb --args ./quicksort $mode $(./rnd.py $num_elements) | grep "breakpoint already" | cut -d ' ' -f4
    done | ./mean.py
done
for inp in sorted same
do
    echo $inp
    for mode in 0 1 2
    do
        gdb -x commands.gdb --args ./quicksort $mode $(./$inp.py $num_elements) | grep "breakpoint already" | cut -d ' ' -f4
    done
done

echo "done........"


# 总共循环多少次"
#root@192.168.1.104:~/programming/algrithm/sort/quicksortx# gdb -x commands.gdb --args ./quicksort 2 $(./rnd.py 100) |grep "breakpoint already"
#1       breakpoint     keep y   0x000000000040072d in partition at quicksort.c:38
#        breakpoint already hit 659 times
#root@192.168.1.104:~/programming/algrithm/sort/quicksortx# ./count.sh 
#random
#719.52
#705.68
#716.23
#sorted
#1001
#1001
#543
#same
#1001
#1001
#1001
#done........
