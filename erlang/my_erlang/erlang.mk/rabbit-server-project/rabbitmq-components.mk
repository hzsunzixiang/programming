
RABBITMQ_COMPONENTS = rabbit 
# Erlang.mk does not rebuild dependencies by default, once they were
# compiled once, except for those listed in the `$(FORCE_REBUILD)`
# variable.
#
# We want all RabbitMQ components to always be rebuilt: this eases
# the work on several components at the same time.

FORCE_REBUILD = $(RABBITMQ_COMPONENTS)


