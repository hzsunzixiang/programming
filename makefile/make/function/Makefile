AWK := awk
PS := ps
PS_FLAGS := -ef
GREP := grep
GREP_FLAGS := -v
# $(call ps_program,awk-pattern)
define ps_program
    @ $(PS) $(PS_FLAGS) |                               \
    $(AWK) '/$1/ {                                      \
                 print "Killing " $$3;                  \
            }'
endef

define no_prameters 
    ps aux|grep vim
endef

# 这是一个普通变量，就是宏展开后的样子
ps_program_1 =     @ $(PS) $(PS_FLAGS) |$(GREP) $(GREP_FLAGS) $(AWK)| $(AWK) '/$1/ { print "Killing " $$0; }'
test:
	$(call ps_program, vim)
	$(call ps_program_1,kthreadd)
	$(call no_prameters)


# 函数其实就是一个宏，宏其实就是一个可以跨多行的变量，如果写成一行，就是一个变量，其中含有$1 等参数
#ps_program =     @ $(PS) $(PS_FLAGS) | $(AWK) '/$1/ { print "Killing " $$3; }'
#ps_program_1 = @ $(PS) $(PS_FLAGS) |$(GREP) $(GREP_FLAGS) $(AWK)| $(AWK) '/$1/ { print "Killing " $$0; }'
#
#
#	$(call kill-program, vim)
# no_prameters =     ps aux|grep vim
