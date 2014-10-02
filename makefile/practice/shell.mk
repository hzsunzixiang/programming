contents := $(shell ls /)
#contents1 := $(shell cat /etc/passwd) # 不加引号不行
contents1 := "$(shell cat /etc/passwd)"


all: 
	@echo $(contents)
	@echo $(contents1)

#8.13 The shell Function
#
#The shell function is unlike any other function other than the wildcard function (see The Function wildcard) in that it communicates with the world outside of make.
#
#The shell function performs the same function that backquotes (‘`’) perform in most shells: it does command expansion. This means that it takes as an argument a shell command and evaluates to the output of the command. The only processing make does on the result is to convert each newline (or carriage-return / newline pair) to a single space. If there is a trailing (carriage-return and) newline it will simply be removed.
#
#The commands run by calls to the shell function are run when the function calls are expanded (see How make Reads a Makefile). Because this function involves spawning a new shell, you should carefully consider the performance implications of using the shell function within recursively expanded variables vs. simply expanded variables (see The Two Flavors of Variables).
#
#Here are some examples of the use of the shell function:
#
#contents := $(shell cat foo)
#sets contents to the contents of the file foo, with a space (rather than a newline) separating each line.
#
#files := $(shell echo *.c)
#sets files to the expansion of ‘*.c’. Unless make is using a very strange shell, this has the same result as ‘$(wildcard *.c)’ (as long as at least one ‘.c’ file exists).
