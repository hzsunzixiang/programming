#! /bin/sh
# print numbers as integers  
awk 'BEGIN { OFMT = "%f";  print 17.23 }'
awk 'BEGIN { OFMT = "%d";  print 17.23 }'





