#! /bin/sh
# Record a 1 for each word that is used at least once.

# Find number of distinct words more than 10 characters long.
awk '{
	for (i = 1; i <= NF; i++)
		used[$i] = 1
    }
END {
	for (x in used)
		if (length(x) > 3) {
			++num_long_words
				print x
		}
	print num_long_words, "words longer than 10 characters"
}'  text
