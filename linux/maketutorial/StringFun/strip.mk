


.PHONY: all

allin:all main
needs_made="    "
ifneq   "$(needs_made)" ""
all:;@echo 'to make!'
else
all:;@echo 'Nothing to make!'
endif

var= c d e f  
var1="  c d e f g   " 
main:
	@echo $(strip a b c )
	@echo $(strip $(var))
	@echo $(strip $(var1))
