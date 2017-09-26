#!/bin/bash
for (( c=1; c<=5; c++ ))
do
   echo "Welcome $c times"
done


for (( c=1; c<=50; c++ ))
do
:
done

echo $c

(( c++, c++, c++))
echo $c

#for((i=0;i<10;i++));do echo $i ;done
