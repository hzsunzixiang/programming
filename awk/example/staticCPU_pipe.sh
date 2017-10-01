#!/bin/sh
#############################################################################
if [ $# -ne 1 ]; then
    echo "usage: staticCPU.sh  <PID>"
    exit
fi

FILE_DIR=./data
PID=$1

grep  -w  $PID $FILE_DIR/top.out| 
awk -F " " '{print $9}'         | 
awk 'BEGIN{a=0;b=0}{a+=$1;b+=1}END{print "Average CPU: " a/b; print "lines: " b}'  
