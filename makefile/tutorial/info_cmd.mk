.PHONY: all
var=99999
all:  
	$(info $$var is [${var}])
	@echo Hello world
	echo '$$var' is [${var}]
