PROJECT = myproject
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0


APPS_DIR := $(CURDIR)/apps

LOCAL_DEPS = webchat

DEPS = cowboy
dep_cowboy_commit = 2.7.0
DEP_PLUGINS = cowboy


## 顺序非常非常的重要，不然直接不能带动起来
include ../../rabbitmq-components.mk
include ../../erlang.mk

