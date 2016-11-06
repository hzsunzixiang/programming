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
