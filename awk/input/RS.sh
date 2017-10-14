#! /bin/sh
awk 'BEGIN { RS = "/" } ; { print $0 }' BBS-list 
