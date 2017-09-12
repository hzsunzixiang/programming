# 演示多目标
# 静态模式规则 static pattern rules
files = foo.so bar.o lose.o

all: $(files)

CFLAGS = -g
CFLAGS1 = -shared -fPIC
$(filter %.o,$(files)): %.o: %.c
	@echo $(filter %.o,$(files))
	$(CC) -c $(CFLAGS) $< -o $@
$(filter %.so,$(files)): %.so: %.c
	@echo $(filter %.so,$(files))
	$(CC) -c $(CFLAGS1) $< -o $@


.PHONEY:clean
clean:
	rm  -f *.x *.o *.so foo

#root@debian:~/programming/makefile/make/make_pattern/static_pattern/static_pattern2# make
#cc -c -shared -fPIC foo.c -o foo.so
#cc -c -g bar.c -o bar.o
#cc -c -g lose.c -o lose.o
#root@debian:~/programming/makefile/make/make_pattern/static_pattern/static_pattern2# make foo
#cc -g    foo.c   -o foo


#	root@debian:~/programming/makefile/make/make_pattern/static_pattern/static_pattern2# make
#	cc -c -shared -fPIC foo.c -o foo.so
#	cc -c -g bar.c -o bar.o
#	#echo bar.o lose.o
#	cc -c -g lose.c -o lose.o
#	#echo bar.o lose.o


#4.12.1 Syntax of Static Pattern Rules
#
#Here is the syntax of a static pattern rule:
#
#targets …: target-pattern: prereq-patterns …
#        recipe
#        …
#The targets list specifies the targets that the rule applies to. The targets can contain wildcard characters, just like the targets of ordinary rules (see Using Wildcard Characters in File Names).
#
#The target-pattern and prereq-patterns say how to compute the prerequisites of each target. Each target is matched against the target-pattern to extract a part of the target name, called the stem. This stem is substituted into each of the prereq-patterns to make the prerequisite names (one from each prereq-pattern).
#
#Each pattern normally contains the character ‘%’ just once. When the target-pattern matches a target, the ‘%’ can match any part of the target name; this part is called the stem. The rest of the pattern must match exactly. For example, the target foo.o matches the pattern ‘%.o’, with ‘foo’ as the stem. The targets foo.c and foo.out do not match that pattern.
#
#The prerequisite names for each target are made by substituting the stem for the ‘%’ in each prerequisite pattern. For example, if one prerequisite pattern is %.c, then substitution of the stem ‘foo’ gives the prerequisite name foo.c. It is legitimate to write a prerequisite pattern that does not contain ‘%’; then this prerequisite is the same for all targets.
#
#‘%’ characters in pattern rules can be quoted with preceding backslashes (‘\’). Backslashes that would otherwise quote ‘%’ characters can be quoted with more backslashes. Backslashes that quote ‘%’ characters or other backslashes are removed from the pattern before it is compared to file names or has a stem substituted into it. Backslashes that are not in danger of quoting ‘%’ characters go unmolested. For example, the pattern the\%weird\\%pattern\\ has ‘the%weird\’ preceding the operative ‘%’ character, and ‘pattern\\’ following it. The final two backslashes are left alone because they cannot affect any ‘%’ character.
#
#Here is an example, which compiles each of foo.o and bar.o from the corresponding .c file:
#
#objects = foo.o bar.o
#
#all: $(objects)
#
#$(objects): %.o: %.c
#        $(CC) -c $(CFLAGS) $< -o $@
#Here ‘$<’ is the automatic variable that holds the name of the prerequisite and ‘$@’ is the automatic variable that holds the name of the target; see Automatic Variables.
#
#Each target specified must match the target pattern; a warning is issued for each target that does not. If you have a list of files, only some of which will match the pattern, you can use the filter function to remove non-matching file names (see Functions for String Substitution and Analysis):
#
#files = foo.elc bar.o lose.o
#
#$(filter %.o,$(files)): %.o: %.c
#        $(CC) -c $(CFLAGS) $< -o $@
#$(filter %.elc,$(files)): %.elc: %.el
#        emacs -f batch-byte-compile $<
#In this example the result of ‘$(filter %.o,$(files))’ is bar.o lose.o, and the first static pattern rule causes each of these object files to be updated by compiling the corresponding C source file. The result of ‘$(filter %.elc,$(files))’ is foo.elc, so that file is made from foo.el.
#
#Another example shows how to use $* in static pattern rules:
#
#bigoutput littleoutput : %output : text.g
#        generate text.g -$* > $@
#When the generate command is run, $* will expand to the stem, either ‘big’ or ‘little’.
