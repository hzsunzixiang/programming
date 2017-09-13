foo = $(bar)
bar = $(ugh)
ugh = Huh?

all:;echo $(foo)

foo1:= $(bar1)
bar1:= $(ugh1)
ugh1:= Huh?

all2:;echo $(foo1)






#6.2 The Two Flavors of Variables
#
#There are two ways that a variable in GNU make can have a value; we call them the two flavors of variables. The two flavors are distinguished in how they are defined and in what they do when expanded.
#
#The first flavor of variable is a recursively expanded variable. Variables of this sort are defined by lines using ‘=’ (see Setting Variables) or by the define directive (see Defining Multi-Line Variables). The value you specify is installed verbatim; if it contains references to other variables, these references are expanded whenever this variable is substituted (in the course of expanding some other string). When this happens, it is called recursive expansion.
#
#For example,
#
#foo = $(bar)
#bar = $(ugh)
#ugh = Huh?
#
#all:;echo $(foo)
#will echo ‘Huh?’: ‘$(foo)’ expands to ‘$(bar)’ which expands to ‘$(ugh)’ which finally expands to ‘Huh?’.
#
#This flavor of variable is the only sort supported by most other versions of make. It has its advantages and its disadvantages. An advantage (most would say) is that:
#
#CFLAGS = $(include_dirs) -O
#include_dirs = -Ifoo -Ibar
#will do what was intended: when ‘CFLAGS’ is expanded in a recipe, it will expand to ‘-Ifoo -Ibar -O’. A major disadvantage is that you cannot append something on the end of a variable, as in
#
#CFLAGS = $(CFLAGS) -O
#because it will cause an infinite loop in the variable expansion. (Actually make detects the infinite loop and reports an error.)
#
#Another disadvantage is that any functions (see Functions for Transforming Text) referenced in the definition will be executed every time the variable is expanded. This makes make run slower; worse, it causes the wildcard and shell functions to give unpredictable results because you cannot easily control when they are called, or even how many times.
#
#To avoid all the problems and inconveniences of recursively expanded variables, there is another flavor: simply expanded variables.
#
#Simply expanded variables are defined by lines using ‘:=’ or ‘::=’ (see Setting Variables). Both forms are equivalent in GNU make; however only the ‘::=’ form is described by the POSIX standard (support for ‘::=’ was added to the POSIX standard in 2012, so older versions of make won’t accept this form either).
#
#The value of a simply expanded variable is scanned once and for all, expanding any references to other variables and functions, when the variable is defined. The actual value of the simply expanded variable is the result of expanding the text that you write. It does not contain any references to other variables; it contains their values as of the time this variable was defined. Therefore,
#
#x := foo
#y := $(x) bar
#x := later
#is equivalent to
#
#y := foo bar
#x := later
#When a simply expanded variable is referenced, its value is substituted verbatim.
#
#Here is a somewhat more complicated example, illustrating the use of ‘:=’ in conjunction with the shell function. (See The shell Function.) This example also shows use of the variable MAKELEVEL, which is changed when it is passed down from level to level. (See Communicating Variables to a Sub-make, for information about MAKELEVEL.)
#
# ifeq (0,${MAKELEVEL})
#whoami    := $(shell whoami)
#host-type := $(shell arch)
#MAKE := ${MAKE} host-type=${host-type} whoami=${whoami}
#endif
#An advantage of this use of ‘:=’ is that a typical ‘descend into a directory’ recipe then looks like this:
#
#${subdirs}:
#        ${MAKE} -C $@ all
#Simply expanded variables generally make complicated makefile programming more predictable because they work like variables in most programming languages. They allow you to redefine a variable using its own value (or its value processed in some way by one of the expansion functions) and to use the expansion functions much more efficiently (see Functions for Transforming Text).
#
#You can also use them to introduce controlled leading whitespace into variable values. Leading whitespace characters are discarded from your input before substitution of variable references and function calls; this means you can include leading spaces in a variable value by protecting them with variable references, like this:
#
#nullstring :=
#space := $(nullstring) # end of the line
#Here the value of the variable space is precisely one space. The comment ‘# end of the line’ is included here just for clarity. Since trailing space characters are not stripped from variable values, just a space at the end of the line would have the same effect (but be rather hard to read). If you put whitespace at the end of a variable value, it is a good idea to put a comment like that at the end of the line to make your intent clear. Conversely, if you do not want any whitespace characters at the end of your variable value, you must remember not to put a random comment on the end of the line after some whitespace, such as this:
#
#dir := /foo/bar    # directory to put the frobs in
#Here the value of the variable dir is ‘/foo/bar    ’ (with four trailing spaces), which was probably not the intention. (Imagine something like ‘$(dir)/file’ with this definition!)
#
#There is another assignment operator for variables, ‘?=’. This is called a conditional variable assignment operator, because it only has an effect if the variable is not yet defined. This statement:
#
#FOO ?= bar
#is exactly equivalent to this (see The origin Function):
#
#ifeq ($(origin FOO), undefined)
#  FOO = bar
#endif
#Note that a variable set to an empty value is still defined, so ‘?=’ will not set that variable.
