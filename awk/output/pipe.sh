#! /bin/sh

awk '{ print $1 > "names.unsorted"
	print $1 | "sort -r > names.sorted" }' BBS-list




