
libs_for_gcc = -lgnu 
normal_libs =  -llibc

ifeq ($(CC),gcc) 
	libs=$(libs_for_gcc) 
else 
	libs=$(normal_libs) 
endif 


foo:
	echo $(libs)&&echo $(CC)



#foo1:
#	ifeq($(CC),gcc)
#		echo $(CC)
#	else 
#		echo $(CC)
#	endif
#
#libs_for_gcc = -lgnu
#normal_libs =  -lhaha
#
#foo2: $(objects)
#		ifeq ($(CC),gcc)
#			$(CC) -o foo $(objects) $(libs_for_gcc)
#		else
#			$(CC) -o foo $(objects) $(normal_libs)
#		endif

#	root@debian:~/programming/makefile# make -f ifeq.mk foo1
#	ifeq(cc,gcc)
#		/bin/sh: 1: Syntax error: word unexpected (expecting ")")
#		make: *** [foo1] Error 2
#		root@debian:~/programming/makefile# make -f ifeq.mk foo
#		echo -llibc &&echo cc
#		-llibc
#		cc


#下面有错误，如果直接跟命令 
#libs_for_gcc = -lgnu 
#normal_libs =  -llibc
#foo:
#	ifeq ($(CC),gcc) 
#		echo $(libs_for_gcc) 
#	else 
#		echo $(normal_libs) 
#	endif 



#foo:
#	echo $(libs)&&echo $(CC)
#




#libs_for_gcc = -lgnu 
#normal_libs =  -llibc
#ifeq ($(CC),gcc) 
#	libs=$(libs_for_gcc) 
#else 
#	libs=$(normal_libs) 
#endif 
#
#
#
#foo:
#	echo $(libs)&&echo $(CC)







#foo: $(objects)
#	ifeq ($(CC),gcc)
#		$(CC) -o foo $(objects) $(libs_for_gcc)
#	else
#		$(CC) -o foo $(objects) $(normal_libs)
#	endif






#7 Conditional Parts of Makefiles
#
#A conditional directive causes part of a makefile to be obeyed or ignored depending on the values of variables. Conditionals can compare the value of one variable to another, or the value of a variable to a constant string. Conditionals control what make actually “sees” in the makefile, so they cannot be used to control recipes at the time of execution.
#
#• Conditional Example:	  	Example of a conditional
#• Conditional Syntax:	  	The syntax of conditionals.
#• Testing Flags:	  	Conditionals that test flags.
#Next: Conditional Syntax, Previous: Conditionals, Up: Conditionals   [Contents][Index]
#
#7.1 Example of a Conditional
#
#The following example of a conditional tells make to use one set of libraries if the CC variable is ‘gcc’, and a different set of libraries otherwise. It works by controlling which of two recipe lines will be used for the rule. The result is that ‘CC=gcc’ as an argument to make changes not only which compiler is used but also which libraries are linked.
#
#libs_for_gcc = -lgnu
#normal_libs =
#
#foo: $(objects)
#		ifeq ($(CC),gcc)
#		        $(CC) -o foo $(objects) $(libs_for_gcc)
#		else
#		        $(CC) -o foo $(objects) $(normal_libs)
#		endif
#		This conditional uses three directives: one ifeq, one else and one endif.
#
#		The ifeq directive begins the conditional, and specifies the condition. It contains two arguments, separated by a comma and surrounded by parentheses. Variable substitution is performed on both arguments and then they are compared. The lines of the makefile following the ifeq are obeyed if the two arguments match; otherwise they are ignored.
#
#		The else directive causes the following lines to be obeyed if the previous conditional failed. In the example above, this means that the second alternative linking command is used whenever the first alternative is not used. It is optional to have an else in a conditional.
#
#		The endif directive ends the conditional. Every conditional must end with an endif. Unconditional makefile text follows.
#
#		As this example illustrates, conditionals work at the textual level: the lines of the conditional are treated as part of the makefile, or ignored, according to the condition. This is why the larger syntactic units of the makefile, such as rules, may cross the beginning or the end of the conditional.
#
#		When the variable CC has the value ‘gcc’, the above example has this effect:
#
#		foo: $(objects)
#		        $(CC) -o foo $(objects) $(libs_for_gcc)
#		When the variable CC has any other value, the effect is this:
#
#		foo: $(objects)
#		        $(CC) -o foo $(objects) $(normal_libs)
#		Equivalent results can be obtained in another way by conditionalizing a variable assignment and then using the variable unconditionally:
#
#		libs_for_gcc = -lgnu
#		normal_libs =
#
#		ifeq ($(CC),gcc)
#		  libs=$(libs_for_gcc)
#		else
#		  libs=$(normal_libs)
#		endif
#
#		foo: $(objects)
#		        $(CC) -o foo $(objects) $(libs)
