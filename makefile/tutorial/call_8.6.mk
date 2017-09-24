#all: $(call variable,param,param) 
#Sets each of the params as $(1), $(2), etc. 
#$(0) is set as the variable name
sweet_new_fn = Variable Name: $(0)  First: $(1) Second: $(2) Empty Variable: $(3)

.PHONY: all
all: 
	@echo $(call sweet_new_fn, go, tigers)
