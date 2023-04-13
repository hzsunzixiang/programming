

all:
	@echo $(MAKE_VERSION)
	@echo $(CURDIR)
	@echo $(MAKEFILE_LIST)
# 只有命令行的指定才回， 不展示默认值
	@echo $(MAKECMDGOALS)
	@echo "$(.VARIABLES)"
	@echo "$(.VARIABLES)" | tr ' ' '\015' | grep MAKEF



# ericksun@centos7-mq1:~/programming/makefile/make/variable/builtin_var (master)$ make -f- FOO=bar -k goal <<< 'goal:;# $(MAKECMDGOALS)'
# ericksun@centos7-mq1:~/programming/makefile/make/variable/builtin_var (master)$ echo 'goal:;# $(MAKECMDGOALS)' | make -f- FOO=bar -k goal
# CC = cc
# COMPILE.cc = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# COMPILE.C = $(COMPILE.cc)
# COMPILE.cpp = $(COMPILE.cc)
# COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# LINK.o = $(CC) $(LDFLAGS) $(TARGET_ARCH)
# OUTPUT_OPTION = -o $@
#
