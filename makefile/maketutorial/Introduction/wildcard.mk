


echo:
	@echo $(wildcard *.mk)
	@echo $(patsubst %.mk,%.o,$(wildcard *.mk))

#4.4.3 The Function wildcard
#
#Wildcard expansion happens automatically in rules. But wildcard expansion does not normally take place when a variable is set, or inside the arguments of a function. If you want to do wildcard expansion in such places, you need to use the wildcard function, like this:
#
#$(wildcard pattern…)
#This string, used anywhere in a makefile, is replaced by a space-separated list of names of existing files that match one of the given file name patterns. If no existing file name matches a pattern, then that pattern is omitted from the output of the wildcard function. Note that this is different from how unmatched wildcards behave in rules, where they are used verbatim rather than ignored (see Wildcard Pitfall).
#
#One use of the wildcard function is to get a list of all the C source files in a directory, like this:
#
#$(wildcard *.c)
#We can change the list of C source files into a list of object files by replacing the ‘.c’ suffix with ‘.o’ in the result, like this:
#
#$(patsubst %.c,%.o,$(wildcard *.c))
#(Here we have used another function, patsubst. See Functions for String Substitution and Analysis.)
#
#Thus, a makefile to compile all C source files in the directory and then link them together could be written as follows:
#
#objects := $(patsubst %.c,%.o,$(wildcard *.c))
#
#foo : $(objects)
#        cc -o foo $(objects)
