#! /bin/sh
awk 'BEGIN {
	"date" | getline current_time
		close("date")
		print "Report printed on " current_time
}'
