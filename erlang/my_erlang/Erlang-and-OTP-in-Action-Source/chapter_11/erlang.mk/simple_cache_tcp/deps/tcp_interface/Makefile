PROJECT = tcp_interface
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

possible_deps_dir_1 = $(abspath ..)
possible_deps_dir_2 = $(abspath ../../..)

ifeq ($(notdir $(possible_deps_dir_1)),deps)
    deps_dir_overriden = 1
    DEPS_DIR ?= $(possible_deps_dir_1)
    DISABLE_DISTCLEAN = 1
endif

ifeq ($(deps_dir_overriden),)
    ifeq ($(notdir $(possible_deps_dir_2)),deps)
    deps_dir_overriden = 1
    DEPS_DIR ?= $(possible_deps_dir_2)
    DISABLE_DISTCLEAN = 1
    endif
endif

DEPS = simple_cache  resource_discovery 

include ../../erlang.mk
