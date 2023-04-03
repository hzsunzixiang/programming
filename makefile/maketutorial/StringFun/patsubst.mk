

#$(patsubst pattern,replacement,text)

all:main bar obj
main:
	@echo $(patsubst %.c,%.o,x.c.c bar.c)


#6.3.1 Substitution References
#A substitution reference substitutes the value of a variable with alterations that you specify. It has the form ‘$(var:a=b)’ (or ‘${var:a=b}’) and its meaning is to take the value of the variable var, replace every a at the end of a word with b in that value, and substitute the resulting string.
#A substitution reference is actually an abbreviation for use of the patsubst expansion function (see Functions for String Substitution and Analysis). We provide substitution references as well as patsubst for compatibility with other implementations of make.

foo := a.o b.o c.o
bar := $(foo:%.o=%.c)
bar:
	@echo $(bar)

#	$(var:suffix=replacement) 	is equivalent to 	$(patsubst %suffix,%replacement,$(var))

objects = foo.o bar.o baz.o

obj:
	@echo $(objects:.o=.c)
	@echo $(patsubst %.o,%.c,$(objects))

#Substitution references (see Substitution References) are a simpler way to get the effect of the patsubst function:
#
#$(var:pattern=replacement)
#	is equivalent to
#
#	$(patsubst pattern,replacement,$(var))
#The second shorthand simplifies one of the most common uses of patsubst: replacing the suffix at the end of file names.
#
#	$(var:suffix=replacement)
#	is equivalent to
#
#	$(patsubst %suffix,%replacement,$(var))


