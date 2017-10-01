#!/bin/sh
#############################################################################
if [ $# -ne 1 ]; then
    echo "usage: staticNet.sh  <eth1>"
    exit
fi

FILE_DIR=./data
ETH1=$1

grep $ETH1 $FILE_DIR/sar_net.out              | 

awk -F " " '{print $5}' $FILE_DIR/sar_net.log |

awk 'BEGIN{a=0;b=0}{a+=$1;b+=1}END{print "receive: " a/b; print "lines: " b}' 

grep $ETH1 $FILE_DIR/sar_net.out              | 
awk -F " " '{print $6}' $FILE_DIR/sar_net.log | 
awk 'BEGIN{a=0;b=0}{a+=$1;b+=1}END{print "transmit: " a/b; print "lines: " b}' 
