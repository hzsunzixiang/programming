#2.4: 
#Variables can only be strings. Here’s an example:
files = file1 file2
some_binary: $(files)
	echo "Look at this variable: " $(files)
	touch some_binary

file1:
	touch file1
file2:
	touch file2
 
clean:
	rm file1 file2 some_binary
