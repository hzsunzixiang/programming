#! /bin/sh
awk '{
	if ((getline tmp) > 0) {
		print tmp
		print $0
	} else
		print $0
}' word
