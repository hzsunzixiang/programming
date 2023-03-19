PROJECT = hello_erlang_mk_1
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0


TEST:
	@echo $(ERLANG_MK_FILENAME)
	@echo $(MAKEFILE_LIST)
	@echo $(lastword $(MAKEFILE_LIST))
	@echo $(realpath $(lastword $(MAKEFILE_LIST)))
include erlang.mk
