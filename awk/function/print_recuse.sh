#!/bin/bash
awk '
function rev (str, len) {
	if (len == 0) {
		printf "\n"
			return
	}
	printf "%c", substr(str, len, 1)
		rev(str, len - 1)
}

BEGIN{ str="hello"; rev(str,length(str))}
'
