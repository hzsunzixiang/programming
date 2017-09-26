#This file will make some_binary the first time, and the second time notice it’s already made, resulting in make: 'some_binary' is up to date.
some_binary:
	touch some_binary
