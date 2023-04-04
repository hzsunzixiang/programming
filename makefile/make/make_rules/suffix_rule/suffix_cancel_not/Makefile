
# 演示 取消后缀规则
CPPFLAGS = -g -Wall
files = foo.o bar.o lose.o


#Suffix rules with no recipe are also meaningless. They do not remove previous rules as do pattern rules with no recipe (see Canceling Implicit Rules). They simply enter the suffix or pair of suffixes concatenated as a target in the data base.
# 如上所述 这样是取消不了后缀规则的
#必须用下面这种
#.SUFFIXES:            # Delete the default suffixes

# 这样无法取消
.c.o:
#	$(CC) -c $(CFLAGS_TMP) $(CPPFLAGS) -o $@ $<

# 后缀规则不像pattern rules那样
# 不写任何recipe 就是取消
#%.o : %.c

#参看
#programming/makefile/make/make_pattern/patten_rules/pattern_rule_cancel/Makefile

all: $(files)
	@echo $(SUFFIXES)

#The variable SUFFIXES is defined to the default list of suffixes before make reads any makefiles. You can change the list of suffixes with a rule for the special target .SUFFIXES, but that does not alter this variable.
.PHONEY:clean
clean:
	rm  -f *.x *.o *.so foo



