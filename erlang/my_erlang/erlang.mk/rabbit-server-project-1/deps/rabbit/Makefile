PROJECT = rabbit
PROJECT_DESCRIPTION = RabbitMQ

# With Erlang.mk default behavior, the value of `$(APPS_DIR)` is always
# relative to the top-level executed Makefile. In our case, it could be
# a plugin for instance. However, the application is
# in this repository, not the plugin's. That's why we need to override
# this value here.
APPS_DIR := $(CURDIR)/apps

LOCAL_DEPS = webchat


include ../../rabbitmq-components.mk
include ../../erlang.mk

