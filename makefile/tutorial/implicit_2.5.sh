#2.5: 
#Example requires: blah.c 
#If we have a target that is a “.c” file, there is an implicit command that will be “cc -c file.c -o file.o”.
## Implicit command of: "cc -c blah.c -o blah.o"
## Note: 1) Do not put a comment inside of the blah.o rule; the implicit rule will not run!
## 		2) If there is no blah.c file, the implicit rule will not run and will not complain.
blah.o:
 
clean:
	rm blah.o
