
LIBRARY = libio.a # LIBRARY has a trailing space.
missing_file:
	touch $(LIBRARY)
	ls -l | grep '$(LIBRARY)'
#The variable assignment contains a trailing space that is made more apparent by the
#comment (but a trailing space can also be present without a trailing comment).
#When this makefile is run, we get:
