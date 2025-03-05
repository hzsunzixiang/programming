#!/bin/bash
# Load all fields of each record into nums.
awk '
function maxelt (vec, i, ret) {
	for (i in vec) {
		if (ret == "" || vec[i] > ret)
			ret = vec[i]
	}
	return ret
}
{
	for(i = 1; i <= NF; i++)
		nums[NR, i] = $i
}
END {
	print maxelt(nums)
}' input
