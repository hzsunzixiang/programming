#Will call other.txt target if it is newer than the some_binary file, or it doesn’t exist. It will call the other.txt rule first.
some_binary: other.txt
	touch some_binary

other.txt:
	touch other.txt
clean:
	rm some_binary other.txt
