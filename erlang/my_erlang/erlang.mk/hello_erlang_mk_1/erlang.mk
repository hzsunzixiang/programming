# Copyright (c) 2013-2016, Loïc Hoguin <essen@ninenines.eu>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

.PHONY: all app apps deps search rel relup docs install-docs check tests clean distclean help erlang-mk

ERLANG_MK_FILENAME := $(realpath $(lastword $(MAKEFILE_LIST)))
export ERLANG_MK_FILENAME

ERLANG_MK_VERSION = 063a24a
ERLANG_MK_WITHOUT = 

# Make 3.81 and 3.82 are deprecated.

ifeq ($(MAKELEVEL)$(MAKE_VERSION),03.81)
$(warning Please upgrade to GNU Make 4 or later: https://erlang.mk/guide/installation.html)
endif

ifeq ($(MAKELEVEL)$(MAKE_VERSION),03.82)
$(warning Please upgrade to GNU Make 4 or later: https://erlang.mk/guide/installation.html)
endif

# Core configuration.

PROJECT ?= $(notdir $(CURDIR))
PROJECT := $(strip $(PROJECT))

PROJECT_VERSION ?= rolling
PROJECT_MOD ?= $(PROJECT)_app
PROJECT_ENV ?= []

# Verbosity.

V ?= 0

verbose_0 = @
verbose_2 = set -x;
verbose = $(verbose_$(V))

ifeq ($(V),3)
SHELL := $(SHELL) -x
endif

gen_verbose_0 = @echo " GEN   " $@;
gen_verbose_2 = set -x;
gen_verbose = $(gen_verbose_$(V))

gen_verbose_esc_0 = @echo " GEN   " $$@;
gen_verbose_esc_2 = set -x;
gen_verbose_esc = $(gen_verbose_esc_$(V))

# Temporary files directory.

ERLANG_MK_TMP ?= $(CURDIR)/.erlang.mk
export ERLANG_MK_TMP

# "erl" command.

ERL = erl +A1 -noinput -boot no_dot_erlang

# Platform detection.

ifeq ($(PLATFORM),)
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
PLATFORM = linux
else ifeq ($(UNAME_S),Darwin)
PLATFORM = darwin
else ifeq ($(UNAME_S),SunOS)
PLATFORM = solaris
else ifeq ($(UNAME_S),GNU)
PLATFORM = gnu
else ifeq ($(UNAME_S),FreeBSD)
PLATFORM = freebsd
else ifeq ($(UNAME_S),NetBSD)
PLATFORM = netbsd
else ifeq ($(UNAME_S),OpenBSD)
PLATFORM = openbsd
else ifeq ($(UNAME_S),DragonFly)
PLATFORM = dragonfly
else ifeq ($(shell uname -o),Msys)
PLATFORM = msys2
else
$(error Unable to detect platform. Please open a ticket with the output of uname -a.)
endif

export PLATFORM
endif

# Core targets.

all:: deps app rel


clean:: clean-crashdump

clean-crashdump:
ifneq ($(wildcard erl_crash.dump),)
	$(gen_verbose) rm -f erl_crash.dump
endif

distclean:: clean distclean-tmp

$(ERLANG_MK_TMP):
	$(verbose) mkdir -p $(ERLANG_MK_TMP)

distclean-tmp:
	$(gen_verbose) rm -rf $(ERLANG_MK_TMP)

help::
	$(verbose) printf "%s\n" \
		"erlang.mk (version $(ERLANG_MK_VERSION)) is distributed under the terms of the ISC License." \
		"Copyright (c) 2013-2016 Loïc Hoguin <essen@ninenines.eu>" \
		"" \
		"Usage: [V=1] $(MAKE) [target]..." \
		"" \
		"Core targets:" \
		"  all           Run deps, app and rel targets in that order" \
		"  app           Compile the project" \
		"  deps          Fetch dependencies (if needed) and compile them" \
		"  fetch-deps    Fetch dependencies recursively (if needed) without compiling them" \
		"  list-deps     List dependencies recursively on stdout" \
		"  search q=...  Search for a package in the built-in index" \
		"  rel           Build a release for this project, if applicable" \
		"  docs          Build the documentation for this project" \
		"  install-docs  Install the man pages for this project" \
		"  check         Compile and run all tests and analysis for this project" \
		"  tests         Run the tests for this project" \
		"  clean         Delete temporary and output files from most targets" \
		"  distclean     Delete all temporary and output files" \
		"  help          Display this help and exit" \
		"  erlang-mk     Update erlang.mk to the latest version"

# Core functions.

empty :=
space := $(empty) $(empty)
tab := $(empty)	$(empty)
comma := ,

define newline


endef

define comma_list
$(subst $(space),$(comma),$(strip $(1)))
endef

define escape_dquotes
$(subst ",\",$1)
endef

# Adding erlang.mk to make Erlang scripts who call init:get_plain_arguments() happy.
define erlang
$(ERL) $2 -pz $(ERLANG_MK_TMP)/rebar/ebin -eval "$(subst $(newline),,$(call escape_dquotes,$1))" -- erlang.mk
endef

ifeq ($(PLATFORM),msys2)
core_native_path = $(shell cygpath -m $1)
else
core_native_path = $1
endif

core_http_get = curl -Lf$(if $(filter-out 0,$(V)),,s)o $(call core_native_path,$1) $2

core_eq = $(and $(findstring $(1),$(2)),$(findstring $(2),$(1)))

# We skip files that contain spaces because they end up causing issues.
core_find = $(if $(wildcard $1),$(shell find $(1:%/=%) \( -type l -o -type f \) -name $(subst *,\*,$2) | grep -v " "))

core_lc = $(subst A,a,$(subst B,b,$(subst C,c,$(subst D,d,$(subst E,e,$(subst F,f,$(subst G,g,$(subst H,h,$(subst I,i,$(subst J,j,$(subst K,k,$(subst L,l,$(subst M,m,$(subst N,n,$(subst O,o,$(subst P,p,$(subst Q,q,$(subst R,r,$(subst S,s,$(subst T,t,$(subst U,u,$(subst V,v,$(subst W,w,$(subst X,x,$(subst Y,y,$(subst Z,z,$(1)))))))))))))))))))))))))))

core_ls = $(filter-out $(1),$(shell echo $(1)))

# @todo Use a solution that does not require using perl.
core_relpath = $(shell perl -e 'use File::Spec; print File::Spec->abs2rel(@ARGV) . "\n"' $1 $2)

define core_render
	printf -- '$(subst $(newline),\n,$(subst %,%%,$(subst ','\'',$(subst $(tab),$(WS),$(call $(1))))))\n' > $(2)
endef

# Automated update.

ERLANG_MK_REPO ?= https://github.com/ninenines/erlang.mk
ERLANG_MK_COMMIT ?=
ERLANG_MK_BUILD_CONFIG ?= build.config
ERLANG_MK_BUILD_DIR ?= .erlang.mk.build

erlang-mk: WITHOUT ?= $(ERLANG_MK_WITHOUT)
erlang-mk:
ifdef ERLANG_MK_COMMIT
	$(verbose) git clone $(ERLANG_MK_REPO) $(ERLANG_MK_BUILD_DIR)
	$(verbose) cd $(ERLANG_MK_BUILD_DIR) && git checkout $(ERLANG_MK_COMMIT)
else
	$(verbose) git clone --depth 1 $(ERLANG_MK_REPO) $(ERLANG_MK_BUILD_DIR)
endif
	$(verbose) if [ -f $(ERLANG_MK_BUILD_CONFIG) ]; then cp $(ERLANG_MK_BUILD_CONFIG) $(ERLANG_MK_BUILD_DIR)/build.config; fi
	$(gen_verbose) $(MAKE) --no-print-directory -C $(ERLANG_MK_BUILD_DIR) WITHOUT='$(strip $(WITHOUT))' UPGRADE=1
	$(verbose) cp $(ERLANG_MK_BUILD_DIR)/erlang.mk ./erlang.mk
	$(verbose) rm -rf $(ERLANG_MK_BUILD_DIR)
	$(verbose) rm -rf $(ERLANG_MK_TMP)

# The erlang.mk package index is bundled in the default erlang.mk build.
# Search for the string "copyright" to skip to the rest of the code.

# Copyright (c) 2015-2017, Loïc Hoguin <essen@ninenines.eu>
# This file is part of erlang.mk and subject to the terms of the ISC License.

.PHONY: distclean-kerl

KERL_INSTALL_DIR ?= $(HOME)/erlang

ifeq ($(strip $(KERL)),)
KERL := $(ERLANG_MK_TMP)/kerl/kerl
endif

KERL_DIR = $(ERLANG_MK_TMP)/kerl

export KERL

KERL_GIT ?= https://github.com/kerl/kerl
KERL_COMMIT ?= master

KERL_MAKEFLAGS ?=

OTP_GIT ?= https://github.com/erlang/otp

define kerl_otp_target
$(KERL_INSTALL_DIR)/$(1): $(KERL)
	$(verbose) if [ ! -d $$@ ]; then \
		MAKEFLAGS="$(KERL_MAKEFLAGS)" $(KERL) build git $(OTP_GIT) $(1) $(1); \
		$(KERL) install $(1) $(KERL_INSTALL_DIR)/$(1); \
	fi
endef

define kerl_hipe_target
$(KERL_INSTALL_DIR)/$1-native: $(KERL)
	$(verbose) if [ ! -d $$@ ]; then \
		KERL_CONFIGURE_OPTIONS=--enable-native-libs \
			MAKEFLAGS="$(KERL_MAKEFLAGS)" $(KERL) build git $(OTP_GIT) $1 $1-native; \
		$(KERL) install $1-native $(KERL_INSTALL_DIR)/$1-native; \
	fi
endef

$(KERL): $(KERL_DIR)

$(KERL_DIR): | $(ERLANG_MK_TMP)
	$(gen_verbose) git clone --depth 1 $(KERL_GIT) $(ERLANG_MK_TMP)/kerl
	$(verbose) cd $(ERLANG_MK_TMP)/kerl && git checkout $(KERL_COMMIT)
	$(verbose) chmod +x $(KERL)

distclean:: distclean-kerl

distclean-kerl:
	$(gen_verbose) rm -rf $(KERL_DIR)

# Allow users to select which version of Erlang/OTP to use for a project.

ifneq ($(strip $(LATEST_ERLANG_OTP)),)
# In some environments it is necessary to filter out master.
ERLANG_OTP := $(notdir $(lastword $(sort\
	$(filter-out $(KERL_INSTALL_DIR)/master $(KERL_INSTALL_DIR)/OTP_R%,\
	$(filter-out %-rc1 %-rc2 %-rc3,$(wildcard $(KERL_INSTALL_DIR)/*[^-native]))))))
endif

ERLANG_OTP ?=
ERLANG_HIPE ?=

# Use kerl to enforce a specific Erlang/OTP version for a project.
ifneq ($(strip $(ERLANG_OTP)),)
export PATH := $(KERL_INSTALL_DIR)/$(ERLANG_OTP)/bin:$(PATH)
SHELL := env PATH=$(PATH) $(SHELL)
$(eval $(call kerl_otp_target,$(ERLANG_OTP)))

# Build Erlang/OTP only if it doesn't already exist.
ifeq ($(wildcard $(KERL_INSTALL_DIR)/$(ERLANG_OTP))$(BUILD_ERLANG_OTP),)
$(info Building Erlang/OTP $(ERLANG_OTP)... Please wait...)
$(shell $(MAKE) $(KERL_INSTALL_DIR)/$(ERLANG_OTP) ERLANG_OTP=$(ERLANG_OTP) BUILD_ERLANG_OTP=1 >&2)
endif

else
# Same for a HiPE enabled VM.
ifneq ($(strip $(ERLANG_HIPE)),)
export PATH := $(KERL_INSTALL_DIR)/$(ERLANG_HIPE)-native/bin:$(PATH)
SHELL := env PATH=$(PATH) $(SHELL)
$(eval $(call kerl_hipe_target,$(ERLANG_HIPE)))

# Build Erlang/OTP only if it doesn't already exist.
ifeq ($(wildcard $(KERL_INSTALL_DIR)/$(ERLANG_HIPE)-native)$(BUILD_ERLANG_OTP),)
$(info Building HiPE-enabled Erlang/OTP $(ERLANG_OTP)... Please wait...)
$(shell $(MAKE) $(KERL_INSTALL_DIR)/$(ERLANG_HIPE)-native ERLANG_HIPE=$(ERLANG_HIPE) BUILD_ERLANG_OTP=1 >&2)
endif

endif
endif

PACKAGES += aberth
pkg_aberth_name = aberth
pkg_aberth_description = Generic BERT-RPC server in Erlang
pkg_aberth_homepage = https://github.com/a13x/aberth
pkg_aberth_fetch = git
pkg_aberth_repo = https://github.com/a13x/aberth
pkg_aberth_commit = master


# Copyright (c) 2015-2016, Loïc Hoguin <essen@ninenines.eu>
# This file is part of erlang.mk and subject to the terms of the ISC License.

.PHONY: search

define pkg_print
	$(verbose) printf "%s\n" \
		$(if $(call core_eq,$(1),$(pkg_$(1)_name)),,"Pkg name:    $(1)") \
		"App name:    $(pkg_$(1)_name)" \
		"Description: $(pkg_$(1)_description)" \
		"Home page:   $(pkg_$(1)_homepage)" \
		"Fetch with:  $(pkg_$(1)_fetch)" \
		"Repository:  $(pkg_$(1)_repo)" \
		"Commit:      $(pkg_$(1)_commit)" \
		""

endef

search:
ifdef q
	$(foreach p,$(PACKAGES), \
		$(if $(findstring $(call core_lc,$(q)),$(call core_lc,$(pkg_$(p)_name) $(pkg_$(p)_description))), \
			$(call pkg_print,$(p))))
else
	$(foreach p,$(PACKAGES),$(call pkg_print,$(p)))
endif

# Copyright (c) 2013-2016, Loïc Hoguin <essen@ninenines.eu>
# This file is part of erlang.mk and subject to the terms of the ISC License.

.PHONY: distclean-deps clean-tmp-deps.log

# Configuration.

ifdef OTP_DEPS
$(warning The variable OTP_DEPS is deprecated in favor of LOCAL_DEPS.)
endif

IGNORE_DEPS ?=
export IGNORE_DEPS

APPS_DIR ?= $(CURDIR)/apps
export APPS_DIR

DEPS_DIR ?= $(CURDIR)/deps
export DEPS_DIR




# When we are calling an app directly we don't want to include it here
# otherwise it'll be treated both as an apps and a top-level project.
ALL_APPS_DIRS = $(if $(wildcard $(APPS_DIR)/),$(filter-out $(APPS_DIR),$(shell find $(APPS_DIR) -maxdepth 1 -type d)))
ifdef ROOT_DIR
ifndef IS_APP
ALL_APPS_DIRS := $(filter-out $(APPS_DIR)/$(notdir $(CURDIR)),$(ALL_APPS_DIRS))
endif
endif

ifeq ($(filter $(APPS_DIR) $(DEPS_DIR),$(subst :, ,$(ERL_LIBS))),)
ifeq ($(ERL_LIBS),)
	ERL_LIBS = $(APPS_DIR):$(DEPS_DIR)
else
	ERL_LIBS := $(ERL_LIBS):$(APPS_DIR):$(DEPS_DIR)
endif
endif
export ERL_LIBS

export NO_AUTOPATCH

# Verbosity.

dep_verbose_0 = @echo " DEP    $1 ($(call dep_commit,$1))";
dep_verbose_2 = set -x;
dep_verbose = $(dep_verbose_$(V))

# Optimization: don't recompile deps unless truly necessary.

ifndef IS_DEP
ifneq ($(MAKELEVEL),0)
$(shell rm -f ebin/dep_built)
endif
endif

# Core targets.

ALL_APPS_DIRS_TO_BUILD = $(if $(LOCAL_DEPS_DIRS)$(IS_APP),$(LOCAL_DEPS_DIRS),$(ALL_APPS_DIRS))

apps:: $(ALL_APPS_DIRS) clean-tmp-deps.log | $(ERLANG_MK_TMP)
# Create ebin directory for all apps to make sure Erlang recognizes them
# as proper OTP applications when using -include_lib. This is a temporary
# fix, a proper fix would be to compile apps/* in the right order.
ifndef IS_APP
ifneq ($(ALL_APPS_DIRS),)
	$(verbose) set -e; for dep in $(ALL_APPS_DIRS) ; do \
		mkdir -p $$dep/ebin; \
	done
endif
endif
# At the toplevel: if LOCAL_DEPS is defined with at least one local app, only
# compile that list of apps. Otherwise, compile everything.
# Within an app: compile all LOCAL_DEPS that are (uncompiled) local apps.
ifneq ($(ALL_APPS_DIRS_TO_BUILD),)
	$(verbose) set -e; for dep in $(ALL_APPS_DIRS_TO_BUILD); do \
		if grep -qs ^$$dep$$ $(ERLANG_MK_TMP)/apps.log; then \
			:; \
		else \
			echo $$dep >> $(ERLANG_MK_TMP)/apps.log; \
			$(MAKE) -C $$dep $(if $(IS_TEST),test-build-app) IS_APP=1; \
		fi \
	done
endif


# Erlang.mk does not rebuild dependencies after they were compiled
# once. If a developer is working on the top-level project and some
# dependencies at the same time, he may want to change this behavior.
# There are two solutions:
#     1. Set `FULL=1` so that all dependencies are visited and
#        recursively recompiled if necessary.
#     2. Set `FORCE_REBUILD=` to the specific list of dependencies that
#        should be recompiled (instead of the whole set).

FORCE_REBUILD ?=

ifeq ($(origin FULL),undefined)
ifneq ($(strip $(force_rebuild_dep)$(FORCE_REBUILD)),)
define force_rebuild_dep
echo "$(FORCE_REBUILD)" | grep -qw "$$(basename "$1")"
endef
endif
endif

ifneq ($(SKIP_DEPS),)
deps::
else
deps:: $(ALL_DEPS_DIRS) apps clean-tmp-deps.log | $(ERLANG_MK_TMP)
ifneq ($(ALL_DEPS_DIRS),)
	$(verbose) set -e; for dep in $(ALL_DEPS_DIRS); do \
		if grep -qs ^$$dep$$ $(ERLANG_MK_TMP)/deps.log; then \
			:; \
		else \
			echo $$dep >> $(ERLANG_MK_TMP)/deps.log; \
			if [ -z "$(strip $(FULL))" ] $(if $(force_rebuild_dep),&& ! ($(call force_rebuild_dep,$$dep)),) && [ ! -L $$dep ] && [ -f $$dep/ebin/dep_built ]; then \
				:; \
			elif [ -f $$dep/GNUmakefile ] || [ -f $$dep/makefile ] || [ -f $$dep/Makefile ]; then \
				$(MAKE) -C $$dep IS_DEP=1; \
				if [ ! -L $$dep ] && [ -d $$dep/ebin ]; then touch $$dep/ebin/dep_built; fi; \
			else \
				echo "Error: No Makefile to build dependency $$dep." >&2; \
				exit 2; \
			fi \
		fi \
	done
endif
endif



ifndef IS_APP
clean:: clean-apps

clean-apps:
	$(verbose) set -e; for dep in $(ALL_APPS_DIRS) ; do \
		$(MAKE) -C $$dep clean IS_APP=1; \
	done

distclean:: distclean-apps

distclean-apps:
	$(verbose) set -e; for dep in $(ALL_APPS_DIRS) ; do \
		$(MAKE) -C $$dep distclean IS_APP=1; \
	done
endif

ifndef SKIP_DEPS
distclean:: distclean-deps

distclean-deps:
	$(gen_verbose) rm -rf $(DEPS_DIR)
endif


# Copyright (c) 2013-2016, Loïc Hoguin <essen@ninenines.eu>
# This file is part of erlang.mk and subject to the terms of the ISC License.

.PHONY: clean-app

# Configuration.

ERLC_OPTS ?= -Werror +debug_info +warn_export_vars +warn_shadow_vars \
	+warn_obsolete_guard # +bin_opt_info +warn_export_all +warn_missing_spec
COMPILE_FIRST ?=
COMPILE_FIRST_PATHS = $(addprefix src/,$(addsuffix .erl,$(COMPILE_FIRST)))
ERLC_EXCLUDE ?=
ERLC_EXCLUDE_PATHS = $(addprefix src/,$(addsuffix .erl,$(ERLC_EXCLUDE)))

ERLC_ASN1_OPTS ?=

ERLC_MIB_OPTS ?=
COMPILE_MIB_FIRST ?=
COMPILE_MIB_FIRST_PATHS = $(addprefix mibs/,$(addsuffix .mib,$(COMPILE_MIB_FIRST)))

# Verbosity.

app_verbose_0 = @echo " APP   " $(PROJECT);
app_verbose_2 = set -x;
app_verbose = $(app_verbose_$(V))

appsrc_verbose_0 = @echo " APP   " $(PROJECT).app.src;
appsrc_verbose_2 = set -x;
appsrc_verbose = $(appsrc_verbose_$(V))

makedep_verbose_0 = @echo " DEPEND" $(PROJECT).d;
makedep_verbose_2 = set -x;
makedep_verbose = $(makedep_verbose_$(V))

erlc_verbose_0 = @echo " ERLC  " $(filter-out $(patsubst %,%.erl,$(ERLC_EXCLUDE)),\
	$(filter %.erl %.core,$(?F)));
erlc_verbose_2 = set -x;
erlc_verbose = $(erlc_verbose_$(V))

xyrl_verbose_0 = @echo " XYRL  " $(filter %.xrl %.yrl,$(?F));
xyrl_verbose_2 = set -x;
xyrl_verbose = $(xyrl_verbose_$(V))

asn1_verbose_0 = @echo " ASN1  " $(filter %.asn1,$(?F));
asn1_verbose_2 = set -x;
asn1_verbose = $(asn1_verbose_$(V))

mib_verbose_0 = @echo " MIB   " $(filter %.bin %.mib,$(?F));
mib_verbose_2 = set -x;
mib_verbose = $(mib_verbose_$(V))

ifneq ($(wildcard src/),)

# Targets.

app:: $(if $(wildcard ebin/test),clean) deps
	$(verbose) $(MAKE) --no-print-directory $(PROJECT).d
	$(verbose) $(MAKE) --no-print-directory app-build

ifeq ($(wildcard src/$(PROJECT_MOD).erl),)
define app_file
{application, '$(PROJECT)', [
	{description, "$(PROJECT_DESCRIPTION)"},
	{vsn, "$(PROJECT_VERSION)"},$(if $(IS_DEP),
	{id$(comma)$(space)"$(1)"}$(comma))
	{modules, [$(call comma_list,$(2))]},
	{registered, []},
	{applications, [$(call comma_list,kernel stdlib $(OTP_DEPS) $(LOCAL_DEPS) $(foreach dep,$(DEPS),$(call dep_name,$(dep))))]},
	{env, $(subst \,\\,$(PROJECT_ENV))}$(if $(findstring {,$(PROJECT_APP_EXTRA_KEYS)),$(comma)$(newline)$(tab)$(subst \,\\,$(PROJECT_APP_EXTRA_KEYS)),)
]}.
endef
else
define app_file
{application, '$(PROJECT)', [
	{description, "$(PROJECT_DESCRIPTION)"},
	{vsn, "$(PROJECT_VERSION)"},$(if $(IS_DEP),
	{id$(comma)$(space)"$(1)"}$(comma))
	{modules, [$(call comma_list,$(2))]},
	{registered, [$(call comma_list,$(PROJECT)_sup $(PROJECT_REGISTERED))]},
	{applications, [$(call comma_list,kernel stdlib $(OTP_DEPS) $(LOCAL_DEPS) $(foreach dep,$(DEPS),$(call dep_name,$(dep))))]},
	{mod, {$(PROJECT_MOD), []}},
	{env, $(subst \,\\,$(PROJECT_ENV))}$(if $(findstring {,$(PROJECT_APP_EXTRA_KEYS)),$(comma)$(newline)$(tab)$(subst \,\\,$(PROJECT_APP_EXTRA_KEYS)),)
]}.
endef
endif

app-build: ebin/$(PROJECT).app
	$(verbose) :

# Source files.

ALL_SRC_FILES := $(sort $(call core_find,src/,*))

ERL_FILES := $(filter %.erl,$(ALL_SRC_FILES))
CORE_FILES := $(filter %.core,$(ALL_SRC_FILES))

# ASN.1 files.

ifneq ($(wildcard asn1/),)
ASN1_FILES = $(sort $(call core_find,asn1/,*.asn1))
ERL_FILES += $(addprefix src/,$(patsubst %.asn1,%.erl,$(notdir $(ASN1_FILES))))

define compile_asn1
	$(verbose) mkdir -p include/
	$(asn1_verbose) erlc -v -I include/ -o asn1/ +noobj $(ERLC_ASN1_OPTS) $(1)
	$(verbose) mv asn1/*.erl src/
	-$(verbose) mv asn1/*.hrl include/
	$(verbose) mv asn1/*.asn1db include/
endef

$(PROJECT).d:: $(ASN1_FILES)
	$(if $(strip $?),$(call compile_asn1,$?))
endif


# Erlang and Core Erlang files.

define makedep.erl
	E = ets:new(makedep, [bag]),
	G = digraph:new([acyclic]),
	ErlFiles = lists:usort(string:tokens("$(ERL_FILES)", " ")),
	DepsDir = "$(call core_native_path,$(DEPS_DIR))",
	AppsDir = "$(call core_native_path,$(APPS_DIR))",
	DepsDirsSrc = "$(if $(wildcard $(DEPS_DIR)/*/src), $(call core_native_path,$(wildcard $(DEPS_DIR)/*/src)))",
	DepsDirsInc = "$(if $(wildcard $(DEPS_DIR)/*/include), $(call core_native_path,$(wildcard $(DEPS_DIR)/*/include)))",
	AppsDirsSrc = "$(if $(wildcard $(APPS_DIR)/*/src), $(call core_native_path,$(wildcard $(APPS_DIR)/*/src)))",
	AppsDirsInc = "$(if $(wildcard $(APPS_DIR)/*/include), $(call core_native_path,$(wildcard $(APPS_DIR)/*/include)))",
	DepsDirs = lists:usort(string:tokens(DepsDirsSrc++DepsDirsInc, " ")),
	AppsDirs = lists:usort(string:tokens(AppsDirsSrc++AppsDirsInc, " ")),
	Modules = [{list_to_atom(filename:basename(F, ".erl")), F} || F <- ErlFiles],
	Add = fun (Mod, Dep) ->
		case lists:keyfind(Dep, 1, Modules) of
			false -> ok;
			{_, DepFile} ->
				{_, ModFile} = lists:keyfind(Mod, 1, Modules),
				ets:insert(E, {ModFile, DepFile}),
				digraph:add_vertex(G, Mod),
				digraph:add_vertex(G, Dep),
				digraph:add_edge(G, Mod, Dep)
		end
	end,
	AddHd = fun (F, Mod, DepFile) ->
		case file:open(DepFile, [read]) of
			{error, enoent} ->
				ok;
			{ok, Fd} ->
				{_, ModFile} = lists:keyfind(Mod, 1, Modules),
				case ets:match(E, {ModFile, DepFile}) of
					[] ->
						ets:insert(E, {ModFile, DepFile}),
						F(F, Fd, Mod,0);
					_ -> ok
				end
		end
	end,
	SearchHrl = fun
		F(_Hrl, []) -> {error,enoent};
		F(Hrl, [Dir|Dirs]) ->
			HrlF = filename:join([Dir,Hrl]),
			case filelib:is_file(HrlF) of
				true  ->
				{ok, HrlF};
				false -> F(Hrl,Dirs)
			end
	end,
	Attr = fun
		(_F, Mod, behavior, Dep) ->
			Add(Mod, Dep);
		(_F, Mod, behaviour, Dep) ->
			Add(Mod, Dep);
		(_F, Mod, compile, {parse_transform, Dep}) ->
			Add(Mod, Dep);
		(_F, Mod, compile, Opts) when is_list(Opts) ->
			case proplists:get_value(parse_transform, Opts) of
				undefined -> ok;
				Dep -> Add(Mod, Dep)
			end;
		(F, Mod, include, Hrl) ->
			case SearchHrl(Hrl, ["src", "include",AppsDir,DepsDir]++AppsDirs++DepsDirs) of
				{ok, FoundHrl} -> AddHd(F, Mod, FoundHrl);
				{error, _} -> false
			end;
		(F, Mod, include_lib, Hrl) ->
			case SearchHrl(Hrl, ["src", "include",AppsDir,DepsDir]++AppsDirs++DepsDirs) of
				{ok, FoundHrl} -> AddHd(F, Mod, FoundHrl);
				{error, _} -> false
			end;
		(F, Mod, import, {Imp, _}) ->
			IsFile =
				case lists:keyfind(Imp, 1, Modules) of
					false -> false;
					{_, FilePath} -> filelib:is_file(FilePath)
				end,
			case IsFile of
				false -> ok;
				true -> Add(Mod, Imp)
			end;
		(_, _, _, _) -> ok
	end,
	MakeDepend = fun
		(F, Fd, Mod, StartLocation) ->
			{ok, Filename} = file:pid2name(Fd),
			case io:parse_erl_form(Fd, undefined, StartLocation) of
				{ok, AbsData, EndLocation} ->
					case AbsData of
						{attribute, _, Key, Value} ->
							Attr(F, Mod, Key, Value),
							F(F, Fd, Mod, EndLocation);
						_ -> F(F, Fd, Mod, EndLocation)
					end;
				{eof, _ } -> file:close(Fd);
				{error, ErrorDescription } ->
					file:close(Fd);
				{error, ErrorInfo, ErrorLocation} ->
					F(F, Fd, Mod, ErrorLocation)
			end,
			ok
	end,
	[begin
		Mod = list_to_atom(filename:basename(F, ".erl")),
		case file:open(F, [read]) of
			{ok, Fd} -> MakeDepend(MakeDepend, Fd, Mod,0);
			{error, enoent} -> ok
		end
	end || F <- ErlFiles],
	Depend = sofs:to_external(sofs:relation_to_family(sofs:relation(ets:tab2list(E)))),
	CompileFirst = [X || X <- lists:reverse(digraph_utils:topsort(G)), [] =/= digraph:in_neighbours(G, X)],
	TargetPath = fun(Target) ->
		case lists:keyfind(Target, 1, Modules) of
			false -> "";
			{_, DepFile} ->
				DirSubname = tl(string:tokens(filename:dirname(DepFile), "/")),
				string:join(DirSubname ++ [atom_to_list(Target)], "/")
		end
	end,
	Output0 = [
		"# Generated by Erlang.mk. Edit at your own risk!\n\n",
		[[F, "::", [[" ", D] || D <- Deps], "; @touch \$$@\n"] || {F, Deps} <- Depend],
		"\nCOMPILE_FIRST +=", [[" ", TargetPath(CF)] || CF <- CompileFirst], "\n"
	],
	Output = case "é" of
		[233] -> unicode:characters_to_binary(Output0);
		_ -> Output0
	end,
	ok = file:write_file("$(1)", Output),
	halt()
endef

ifeq ($(if $(NO_MAKEDEP),$(wildcard $(PROJECT).d),),)
$(PROJECT).d:: $(ERL_FILES) $(call core_find,include/,*.hrl) $(MAKEFILE_LIST)
	$(makedep_verbose) $(call erlang,$(call makedep.erl,$@))
endif

ifeq ($(IS_APP)$(IS_DEP),)
ifneq ($(words $(ERL_FILES) $(CORE_FILES) $(ASN1_FILES) $(MIB_FILES) $(XRL_FILES) $(YRL_FILES)),0)
# Rebuild everything when the Makefile changes.
$(ERLANG_MK_TMP)/last-makefile-change: $(MAKEFILE_LIST) | $(ERLANG_MK_TMP)
	$(verbose) if test -f $@; then \
		touch $(ERL_FILES) $(CORE_FILES) $(ASN1_FILES) $(MIB_FILES) $(XRL_FILES) $(YRL_FILES); \
		touch -c $(PROJECT).d; \
	fi
	$(verbose) touch $@

$(ERL_FILES) $(CORE_FILES) $(ASN1_FILES) $(MIB_FILES) $(XRL_FILES) $(YRL_FILES):: $(ERLANG_MK_TMP)/last-makefile-change
ebin/$(PROJECT).app:: $(ERLANG_MK_TMP)/last-makefile-change
endif
endif

$(PROJECT).d::
	$(verbose) :

include $(wildcard $(PROJECT).d)

ebin/$(PROJECT).app:: ebin/

ebin/:
	$(verbose) mkdir -p ebin/

define compile_erl
	$(erlc_verbose) erlc -v $(if $(IS_DEP),$(filter-out -Werror,$(ERLC_OPTS)),$(ERLC_OPTS)) -o ebin/ \
		-pa ebin/ -I include/ $(filter-out $(ERLC_EXCLUDE_PATHS),$(COMPILE_FIRST_PATHS) $(1))
endef

define validate_app_file
	case file:consult("ebin/$(PROJECT).app") of
		{ok, _} -> halt();
		_ -> halt(1)
	end
endef

ebin/$(PROJECT).app:: $(ERL_FILES) $(CORE_FILES) $(wildcard src/$(PROJECT).app.src)
	$(eval FILES_TO_COMPILE := $(filter-out src/$(PROJECT).app.src,$?))
	$(if $(strip $(FILES_TO_COMPILE)),$(call compile_erl,$(FILES_TO_COMPILE)))
# Older git versions do not have the --first-parent flag. Do without in that case.
	$(eval GITDESCRIBE := $(shell git describe --dirty --abbrev=7 --tags --always --first-parent 2>/dev/null \
		|| git describe --dirty --abbrev=7 --tags --always 2>/dev/null || true))
	$(eval MODULES := $(patsubst %,'%',$(sort $(notdir $(basename \
		$(filter-out $(ERLC_EXCLUDE_PATHS),$(ERL_FILES) $(CORE_FILES) $(BEAM_FILES)))))))
ifeq ($(wildcard src/$(PROJECT).app.src),)
	$(app_verbose) printf '$(subst %,%%,$(subst $(newline),\n,$(subst ','\'',$(call app_file,$(GITDESCRIBE),$(MODULES)))))' \
		> ebin/$(PROJECT).app
	$(verbose) if ! $(call erlang,$(call validate_app_file)); then \
		echo "The .app file produced is invalid. Please verify the value of PROJECT_ENV." >&2; \
		exit 1; \
	fi
else
	$(verbose) if [ -z "$$(grep -e '^[^%]*{\s*modules\s*,' src/$(PROJECT).app.src)" ]; then \
		echo "Empty modules entry not found in $(PROJECT).app.src. Please consult the erlang.mk documentation for instructions." >&2; \
		exit 1; \
	fi
	$(appsrc_verbose) cat src/$(PROJECT).app.src \
		| sed "s/{[[:space:]]*modules[[:space:]]*,[[:space:]]*\[\]}/{modules, \[$(call comma_list,$(MODULES))\]}/" \
		| sed "s/{id,[[:space:]]*\"git\"}/{id, \"$(subst /,\/,$(GITDESCRIBE))\"}/" \
		> ebin/$(PROJECT).app
endif
ifneq ($(wildcard src/$(PROJECT).appup),)
	$(verbose) cp src/$(PROJECT).appup ebin/
endif

clean:: clean-app

clean-app:
	$(gen_verbose) rm -rf $(PROJECT).d ebin/ priv/mibs/ $(XRL_ERL_FILES) $(YRL_ERL_FILES) \
		$(addprefix include/,$(patsubst %.mib,%.hrl,$(notdir $(MIB_FILES)))) \
		$(addprefix include/,$(patsubst %.asn1,%.hrl,$(notdir $(ASN1_FILES)))) \
		$(addprefix include/,$(patsubst %.asn1,%.asn1db,$(notdir $(ASN1_FILES)))) \
		$(addprefix src/,$(patsubst %.asn1,%.erl,$(notdir $(ASN1_FILES))))

endif

