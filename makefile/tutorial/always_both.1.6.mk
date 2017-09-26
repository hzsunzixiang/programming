#This will always make both targets, because some_binary depends on other.txt, which is never created.
some_binary: other.txt
	touch some_binary

.PHONY: other.txt
other.txt:
	echo "nothing"
