#shell - This calls the shell, but it removes newlines!
.PHONY: all
all: 
	@echo $(shell ls -la) # Very ugly because the newlines are gone!
