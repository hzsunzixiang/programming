long-command:
	@echo Line 2: A blank line follows

	@echo Line 4: A shell comment follows
	# A shell comment (leading tab)
	@echo Line 6: A make comment follows
    # A make comment, at the beginning of a line
	@echo Line 8: Indented make comments follow
  # A make comment, indented with leading spaces
# Another make comment, indented with leading spaces
	@echo Line 11: A conditional follows
  ifdef COMSPEC
	@echo Running Windows
  endif
	@echo Line 15: A warning "command" follows
	$(warning A warning)
	@echo Line 17: An eval "command" follows
	$(eval $(shell echo Shell echo 1>&2))

# 被make处理之后 没有tab前导的make 注释都被过滤了
#long-command:
##  Implicit rule search has not been done.
##  Modification time never checked.
##  File has not been updated.
##  recipe to execute (from `Makefile', line 2):
#	@echo Line 2: A blank line follows
#	@echo Line 4: A shell comment follows
#	# A shell comment (leading tab)
#	@echo Line 6: A make comment follows
#	@echo Line 8: Indented make comments follow
#	@echo Line 11: A conditional follows
#	@echo Line 15: A warning "command" follows
#	$(warning A warning)
#	@echo Line 17: An eval "command" follows
#	$(eval $(shell echo Shell echo 1>&2))
#

#Makefile:2: A warning
#Shell echo
#Line 2: A blank line follows
#Line 4: A shell comment follows
## A shell comment (leading tab)
#Line 6: A make comment follows
#Line 8: Indented make comments follow
#Line 11: A conditional follows
#Line 15: A warning command follows
#Line 17: An eval command follows

