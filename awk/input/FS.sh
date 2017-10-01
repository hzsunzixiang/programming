#! /bin/sh
#awk '{ print $NR }' BBS-list 
#awk '{ print $(2*2) }' BBS-list 
awk '{  print $2, $3 }' inventory-shipped
