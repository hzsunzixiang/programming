#! /bin/sh
#awk 'END{ print "the RS:\t", FNR}' BBS-list 
awk '{ print "the RS:\t", NR}' BBS-list inventory-shipped 
