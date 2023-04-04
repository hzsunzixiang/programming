VPATH=lib
objects = foo.o bar.o lib/zoo.o

CPPFLAGS=-Wall -g


#覆盖默认规则  
%.o : %.c
	$(CC)  $(CPPFLAGS) $< -o $@
# 如果注释掉上面这一行就会报错 表示取消默认规则 

#StephenSun@debian-1:~/programming/makefile/make/make_pattern/patten_rules/pattern_rule_cancel$ make 
#make: *** No rule to make target `foo.o', needed by `all'.  Stop.


all: $(objects)

.PHONEY:clean
clean:
	rm  -f $(objects)




#10.5.6 Canceling Implicit Rules
#
#You can override a built-in implicit rule (or one you have defined yourself) by defining a new pattern rule with the same target and prerequisites, but a different recipe. When the new rule is defined, the built-in one is replaced. The new rule’s position in the sequence of implicit rules is determined by where you write the new rule.
#
#You can cancel a built-in implicit rule by defining a pattern rule with the same target and prerequisites, but no recipe. For example, the following would cancel the rule that runs the assembler:
#
#%.o : %.s
