PROJECT = hello_apps_dir_deps_out_release
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

BUILD_DEPS += bbmustache relx
dep_bbmustache = git https://github.com/soranoba/bbmustache.git master
dep_relx = git https://github.com/erlware/relx.git  main


DEPS = cowboy
dep_cowboy_commit = 2.7.0
DEP_PLUGINS = cowboy


# 本地依赖
#LOCAL_DEPS = webchat



include erlang.mk
