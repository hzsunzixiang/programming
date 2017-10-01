#! /bin/sh
awk 'BEGIN { format = "%-10s %s\n"
	 printf format, "Name", "Number"
	 printf format, "----", "------" }
{ printf format, $1, $2 }' BBS-list
