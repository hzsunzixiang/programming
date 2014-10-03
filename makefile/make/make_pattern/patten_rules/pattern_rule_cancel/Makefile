VPATH=lib
objects = foo.o bar.o lib/zoo.o

#CFLAGS=-Wall -g

# 这里只有一个百分号，默认是生成可执行文件的,即linux下的可执行文件一般没有后缀
%.o : %.c
	$(CC)  $(CFLAGS) $(CPPFLAGS) $< -o $@
# 如果注释掉上面这行就会报错 
# root@debian:~/programming/makefile/make/make_pattern/patten_rules/pattern_rule_cancel# make
# make: *** No rule to make target `foo.o', needed by `all'.  Stop.

all: $(objects)

.PHONEY:clean
clean:
	rm  -f foo.o bar.o lib/zoo.o




#10.5.6 Canceling Implicit Rules
#
#You can override a built-in implicit rule (or one you have defined yourself) by defining a new pattern rule with the same target and prerequisites, but a different recipe. When the new rule is defined, the built-in one is replaced. The new rule’s position in the sequence of implicit rules is determined by where you write the new rule.
#
#You can cancel a built-in implicit rule by defining a pattern rule with the same target and prerequisites, but no recipe. For example, the following would cancel the rule that runs the assembler:
#
#%.o : %.s
