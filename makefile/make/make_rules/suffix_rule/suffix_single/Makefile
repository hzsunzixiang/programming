
# 演示 后缀规则
CPPFLAGS = -g -Wall
files = foo lose

#A single-suffix rule is defined by a single suffix, which is the source suffix. It matches any file name, and the corresponding implicit prerequisite name is made by appending the source suffix. A single-suffix rule whose source suffix is ‘.c’ is equivalent to the pattern rule ‘% : %.c’.
# 下面两行注释掉， 看下结果中没有 -g
# 单后缀规则,表示由 .c 文件 , 隐含生成可执行文件的规则 
.c:
	$(CC) $(CPPFLAGS) -o $@ $^

all: $(files)


.PHONEY:clean
clean:
	rm  -f *.x *.o *.so $(files) 

#%.o: %.c 
#	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<


#10.7 Old-Fashioned Suffix Rules
#
#Suffix rules are the old-fashioned way of defining implicit rules for make. Suffix rules are obsolete because pattern rules are more general and clearer. They are supported in GNU make for compatibility with old makefiles. They come in two kinds: double-suffix and single-suffix.
#
#A double-suffix rule is defined by a pair of suffixes: the target suffix and the source suffix. It matches any file whose name ends with the target suffix. The corresponding implicit prerequisite is made by replacing the target suffix with the source suffix in the file name. A two-suffix rule whose target and source suffixes are ‘.o’ and ‘.c’ is equivalent to the pattern rule ‘%.o : %.c’.
#
#A single-suffix rule is defined by a single suffix, which is the source suffix. It matches any file name, and the corresponding implicit prerequisite name is made by appending the source suffix. A single-suffix rule whose source suffix is ‘.c’ is equivalent to the pattern rule ‘% : %.c’.
#
#Suffix rule definitions are recognized by comparing each rule’s target against a defined list of known suffixes. When make sees a rule whose target is a known suffix, this rule is considered a single-suffix rule. When make sees a rule whose target is two known suffixes concatenated, this rule is taken as a double-suffix rule.
#
#For example, ‘.c’ and ‘.o’ are both on the default list of known suffixes. Therefore, if you define a rule whose target is ‘.c.o’, make takes it to be a double-suffix rule with source suffix ‘.c’ and target suffix ‘.o’. Here is the old-fashioned way to define the rule for compiling a C source file:
#
#.c.o:
#        $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
#Suffix rules cannot have any prerequisites of their own. If they have any, they are treated as normal files with funny names, not as suffix rules. Thus, the rule:
#
#.c.o: foo.h
#        $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
#tells how to make the file .c.o from the prerequisite file foo.h, and is not at all like the pattern rule:
#
#%.o: %.c foo.h
#        $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
#which tells how to make ‘.o’ files from ‘.c’ files, and makes all ‘.o’ files using this pattern rule also depend on foo.h.
#
#Suffix rules with no recipe are also meaningless. They do not remove previous rules as do pattern rules with no recipe (see Canceling Implicit Rules). They simply enter the suffix or pair of suffixes concatenated as a target in the data base.
#
#The known suffixes are simply the names of the prerequisites of the special target .SUFFIXES. You can add your own suffixes by writing a rule for .SUFFIXES that adds more prerequisites, as in:
#
#.SUFFIXES: .hack .win
#which adds ‘.hack’ and ‘.win’ to the end of the list of suffixes.
#
#If you wish to eliminate the default known suffixes instead of just adding to them, write a rule for .SUFFIXES with no prerequisites. By special dispensation, this eliminates all existing prerequisites of .SUFFIXES. You can then write another rule to add the suffixes you want. For example,
#
#.SUFFIXES:            # Delete the default suffixes
#.SUFFIXES: .c .o .h   # Define our suffix list
#The ‘-r’ or ‘--no-builtin-rules’ flag causes the default list of suffixes to be empty.
#
#The variable SUFFIXES is defined to the default list of suffixes before make reads any makefiles. You can change the list of suffixes with a rule for the special target .SUFFIXES, but that does not alter this variable.
