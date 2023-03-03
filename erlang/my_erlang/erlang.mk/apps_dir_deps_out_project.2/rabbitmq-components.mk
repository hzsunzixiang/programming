
RABBITMQ_COMPONENTS = myproject
# Erlang.mk does not rebuild dependencies by default, once they were
# compiled once, except for those listed in the `$(FORCE_REBUILD)`
# variable.
#
# We want all RabbitMQ components to always be rebuilt: this eases
# the work on several components at the same time.

FORCE_REBUILD = $(RABBITMQ_COMPONENTS)


# Umbrella-specific settings.
# --------------------------------------------------------------------

# If the top-level project is a RabbitMQ component, we override
# $(DEPS_DIR) for this project to point to the top-level's one.
#
# We also verify that the guessed DEPS_DIR is actually named `deps`,
# to rule out any situation where it is a coincidence that we found a
# `rabbitmq-components.mk` up upper directories.

possible_deps_dir_1 = $(abspath ..)
possible_deps_dir_2 = $(abspath ../../..)

ifeq ($(notdir $(possible_deps_dir_1)),deps)
ifneq ($(wildcard $(possible_deps_dir_1)/../rabbitmq-components.mk),)
deps_dir_overriden = 1
DEPS_DIR ?= $(possible_deps_dir_1)
DISABLE_DISTCLEAN = 1
endif
endif

ifeq ($(deps_dir_overriden),)
ifeq ($(notdir $(possible_deps_dir_2)),deps)
ifneq ($(wildcard $(possible_deps_dir_2)/../rabbitmq-components.mk),)
deps_dir_overriden = 1
DEPS_DIR ?= $(possible_deps_dir_2)
DISABLE_DISTCLEAN = 1
endif
endif
endif

