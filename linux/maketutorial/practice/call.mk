

all:hello path
reverse = $(2) $(1)
foo = $(call reverse,a,b)
hello:
	@echo $(foo)

#没看明白
pathsearch = $(firstword $(wildcard $(addsuffix /$(1),$(subst :, ,$(PATH)))))
LS := $(call pathsearch,ls)
path:
	@echo $(LS)
