# GNU Make 3.82
# Built for x86_64-redhat-linux-gnu
# Copyright (C) 2010  Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
3.82
/home/ericksun/programming/makefile/make/variable/builtin_var
Makefile

<D ?F .SHELLFLAGS CWEAVE ?D @D @F MAKE_VERSION CURDIR SHELL RM CO COMPILE.mod _ PREPROCESS.F LINK.m LINK.o OUTPUT_OPTION COMPILE.cpp MAKEFILE_LIST HISTCONTROL LINK.p XDG_DATA_DIRS CC CHECKOUT,v LESSOPEN CPP LINK.cc SSH_CONNECTION PATH LD TEST_CPPFLAGS TEXI2DVI YACC SSH_TTY XDG_RUNTIME_DIR ARFLAGS LINK.r TEST_CFLAGS LINT COMPILE.f LINT.c YACC.m YACC.y PREPROCESS.r AR SELINUX_USE_CURRENT_RANGE .FEATURES TANGLE LS_COLORS GET %F DISPLAY COMPILE.F CTANGLE TMUX_PANE .LIBPATTERNS LINK.C PWD LINK.S TEST_OBJCFLAGS *D LINK.c LINK.s HOME LOGNAME SELINUX_LEVEL_REQUESTED ^D HOSTNAME MAKELEVEL COMPILE.m MAKE SHLVL AS PREPROCESS.S COMPILE.p XDG_SESSION_ID USER FC .DEFAULT_GOAL %D WEAVE MAKE_COMMAND LINK.cpp F77 OLDPWD .VARIABLES PC CVS_RSH *F COMPILE.def LEX MAKEFLAGS MFLAGS SSH_CLIENT MAIL LEX.l LEX.m +D COMPILE.r TMUX +F M2C MAKEFILES TEST_LDFLAGS COMPILE.cc <F CXX COFLAGS COMPILE.C ^F SELINUX_ROLE_REQUESTED COMPILE.S LINK.F SUFFIXES HISTSIZE COMPILE.c COMPILE.s .INCLUDE_DIRS .RECIPEPREFIX MAKEINFO OBJC TEX LANG TERM F77FLAGS LINK.f
<D?F.SHELLFLAGSCWEAVE?D@D@FMAKE_VERSIONCURDIRSHELLRMCOCOMPILE.mod_PREPROCESS.FLINK.mLINK.oOUTPUT_OPTIONCOMPILE.cppMAKEFILE_LISTHISTCONTROLLINK.pXDG_DATA_DIRSCCCHECKOUT,vLESSOPENCPPLINK.ccSSH_CONNECTIONPATHLDTEST_CPPFLAGSTEXI2DVIYACCSSH_TTYXDG_RUNTIME_DIRARFLAGSLINK.rTEST_CFLAGSLINTCOMPILE.fLINT.cYACC.mYACC.yPREPROCESS.rARSELINUX_USE_CURRENT_RANGE.FEATURESTANGLELS_COLORSGET%FDISPLAYCOMPILE.FCTANGLETMUX_PANE.LIBPATTERNSLINK.CPWDLINK.STEST_OBJCFLAGS*DLINK.cLINK.sHOMELOGNAMESELINUX_LEVEL_REQUESTED^DHOSTNAMEMAKELEVELCOMPILE.mMAKESHLVLASPREPROCESS.SCOMPILE.pXDG_SESSION_IDUSERFC.DEFAULT_GOAL%DWEAVEMAKE_COMMANDLINK.cppF77OLDPWD.VARIABLESPCCVS_RSH*FCOMPILE.defLEXMAKEFLAGSMFLAGSSSH_CLIENTMAILLEX.lLEX.m+DCOMPILE.rTMUX+FM2CMAKEFILESTEST_LDFLAGSCOMPILE.cc<FCXXCOFLAGSCOMPILE.C^FSELINUX_ROLE_REQUESTEDCOMPILE.SLINK.FSUFFIXESHISTSIZECOMPILE.cCOMPILE.s.INCLUDE_DIRS.RECIPEPREFIXMAKEINFOOBJCTEXLANGTERMF77FLAGSLINK.f

# Make data base, printed on Wed Apr 12 23:51:50 2023

# Variables

# automatic
<D = $(patsubst %/,%,$(dir $<))
# automatic
?F = $(notdir $?)
# default
.SHELLFLAGS := -c
# default
CWEAVE = cweave
# automatic
?D = $(patsubst %/,%,$(dir $?))
# automatic
@D = $(patsubst %/,%,$(dir $@))
# automatic
@F = $(notdir $@)
# default
MAKE_VERSION := 3.82
# makefile
CURDIR := /home/ericksun/programming/makefile/make/variable/builtin_var
# makefile
SHELL = /bin/sh
# default
RM = rm -f
# default
CO = co
# default
COMPILE.mod = $(M2C) $(M2FLAGS) $(MODFLAGS) $(TARGET_ARCH)
# environment
_ = /usr/bin/make
# default
PREPROCESS.F = $(FC) $(FFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -F
# default
LINK.m = $(OBJC) $(OBJCFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# default
LINK.o = $(CC) $(LDFLAGS) $(TARGET_ARCH)
# default
OUTPUT_OPTION = -o $@
# default
COMPILE.cpp = $(COMPILE.cc)
# makefile (from `Makefile', line 1)
MAKEFILE_LIST :=  Makefile
# environment
HISTCONTROL = ignoreboth
# default
LINK.p = $(PC) $(PFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# environment
XDG_DATA_DIRS = /home/ericksun/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
# default
CC = cc
# default
CHECKOUT,v = +$(if $(wildcard $@),,$(CO) $(COFLAGS) $< $@)
# environment
LESSOPEN = ||/usr/bin/lesspipe.sh %s
# default
CPP = $(CC) -E
# default
LINK.cc = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# environment
SSH_CONNECTION = 192.168.142.1 57011 192.168.142.137 22
# environment
PATH = /usr/local/wxWidgets/bin:/home/ericksun/program/gitv2.9.5/libexec/:/home/ericksun/program/gitv2.9.5/bin:/home/ericksun/program/elixir/bin:/home/ericksun/program/otp-25.0.4/bin:/opt/emacs28/bin~/.emacs.d/bin/:/home/ericksun/program/rabbitmq-server/sbin:/usr/local/wxWidgets/bin:/home/ericksun/program/gitv2.9.5/libexec/:/home/ericksun/program/gitv2.9.5/bin:/home/ericksun/program/elixir/bin:/home/ericksun/program/otp-25.0.4/bin:/opt/emacs28/bin~/.emacs.d/bin/:/home/ericksun/program/rabbitmq-server/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ericksun/.local/bin:/home/ericksun/bin:/home/ericksun/.local/bin:/home/ericksun/bin
# default
LD = ld
# environment
TEST_CPPFLAGS = CPPFLAGS_IN_ENV
# default
TEXI2DVI = texi2dvi
# default
YACC = yacc
# environment
SSH_TTY = /dev/pts/0
# environment
XDG_RUNTIME_DIR = /run/user/1001
# default
ARFLAGS = rv
# default
LINK.r = $(FC) $(FFLAGS) $(RFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# environment
TEST_CFLAGS = -g
# default
LINT = lint
# default
COMPILE.f = $(FC) $(FFLAGS) $(TARGET_ARCH) -c
# default
LINT.c = $(LINT) $(LINTFLAGS) $(CPPFLAGS) $(TARGET_ARCH)
# default
YACC.m = $(YACC) $(YFLAGS)
# default
YACC.y = $(YACC) $(YFLAGS)
# default
PREPROCESS.r = $(FC) $(FFLAGS) $(RFLAGS) $(TARGET_ARCH) -F
# default
AR = ar
# environment
SELINUX_USE_CURRENT_RANGE = 
# default
.FEATURES := target-specific order-only second-expansion else-if shortest-stem undefine oneshell archives jobserver check-symlink
# default
TANGLE = tangle
# environment
LS_COLORS = rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
# default
GET = get
# automatic
%F = $(notdir $%)
# environment
DISPLAY = localhost:10.0
# default
COMPILE.F = $(FC) $(FFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# default
CTANGLE = ctangle
# environment
TMUX_PANE = %9
# default
.LIBPATTERNS = lib%.so lib%.a
# default
LINK.C = $(LINK.cc)
# environment
PWD = /home/ericksun/programming/makefile/make/variable/builtin_var
# default
LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_MACH)
# environment
TEST_OBJCFLAGS = OBJFLAGS_IN_ENV
# automatic
*D = $(patsubst %/,%,$(dir $*))
# default
LINK.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# default
LINK.s = $(CC) $(ASFLAGS) $(LDFLAGS) $(TARGET_MACH)
# environment
HOME = /home/ericksun
# environment
LOGNAME = ericksun
# environment
SELINUX_LEVEL_REQUESTED = 
# automatic
^D = $(patsubst %/,%,$(dir $^))
# environment
HOSTNAME = centos7-mq1
# environment
MAKELEVEL := 0
# default
COMPILE.m = $(OBJC) $(OBJCFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# default
MAKE = $(MAKE_COMMAND)
# environment
SHLVL = 2
# default
AS = as
# default
PREPROCESS.S = $(CC) -E $(CPPFLAGS)
# default
COMPILE.p = $(PC) $(PFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# environment
XDG_SESSION_ID = 7
# environment
USER = ericksun
# default
FC = f77
# makefile
.DEFAULT_GOAL := all
# automatic
%D = $(patsubst %/,%,$(dir $%))
# default
WEAVE = weave
# default
MAKE_COMMAND := make
# default
LINK.cpp = $(LINK.cc)
# default
F77 = $(FC)
# environment
OLDPWD = /home/ericksun/programming/makefile/make/variable
# default
.VARIABLES := <D ?F .SHELLFLAGS CWEAVE ?D @D @F MAKE_VERSION CURDIR SHELL RM CO COMPILE.mod _ PREPROCESS.F LINK.m LINK.o OUTPUT_OPTION COMPILE.cpp MAKEFILE_LIST HISTCONTROL LINK.p XDG_DATA_DIRS CC CHECKOUT,v LESSOPEN CPP LINK.cc SSH_CONNECTION PATH LD TEST_CPPFLAGS TEXI2DVI YACC SSH_TTY XDG_RUNTIME_DIR ARFLAGS LINK.r TEST_CFLAGS LINT COMPILE.f LINT.c YACC.m YACC.y PREPROCESS.r AR SELINUX_USE_CURRENT_RANGE .FEATURES TANGLE LS_COLORS GET %F DISPLAY COMPILE.F CTANGLE TMUX_PANE .LIBPATTERNS LINK.C PWD LINK.S TEST_OBJCFLAGS *D LINK.c LINK.s HOME LOGNAME SELINUX_LEVEL_REQUESTED ^D HOSTNAME MAKELEVEL COMPILE.m MAKE SHLVL AS PREPROCESS.S COMPILE.p XDG_SESSION_ID USER FC .DEFAULT_GOAL %D WEAVE MAKE_COMMAND LINK.cpp F77 OLDPWD .VARIABLES PC CVS_RSH *F COMPILE.def LEX MAKEFLAGS MFLAGS SSH_CLIENT MAIL LEX.l LEX.m +D COMPILE.r TMUX +F M2C MAKEFILES TEST_LDFLAGS COMPILE.cc <F CXX COFLAGS COMPILE.C ^F SELINUX_ROLE_REQUESTED COMPILE.S LINK.F SUFFIXES HISTSIZE COMPILE.c COMPILE.s .INCLUDE_DIRS .RECIPEPREFIX MAKEINFO OBJC TEX LANG TERM F77FLAGS LINK.f
# default
PC = pc
# environment
CVS_RSH = ssh
# automatic
*F = $(notdir $*)
# default
COMPILE.def = $(M2C) $(M2FLAGS) $(DEFFLAGS) $(TARGET_ARCH)
# default
LEX = lex
# makefile
MAKEFLAGS = p
# environment
MFLAGS = -p
# environment
SSH_CLIENT = 192.168.142.1 52996 22
# environment
MAIL = /var/spool/mail/ericksun
# default
LEX.l = $(LEX) $(LFLAGS) -t
# default
LEX.m = $(LEX) $(LFLAGS) -t
# automatic
+D = $(patsubst %/,%,$(dir $+))
# default
COMPILE.r = $(FC) $(FFLAGS) $(RFLAGS) $(TARGET_ARCH) -c
# environment
TMUX = /tmp/tmux-1001/default,12654,2
# automatic
+F = $(notdir $+)
# default
M2C = m2c
# default
MAKEFILES := 
# environment
TEST_LDFLAGS = -TESTEB
# default
COMPILE.cc = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# automatic
<F = $(notdir $<)
# default
CXX = g++
# default
COFLAGS = 
# default
COMPILE.C = $(COMPILE.cc)
# automatic
^F = $(notdir $^)
# environment
SELINUX_ROLE_REQUESTED = 
# default
COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_MACH) -c
# default
LINK.F = $(FC) $(FFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# default
SUFFIXES := .out .a .ln .o .c .cc .C .cpp .p .f .F .m .r .y .l .ym .yl .s .S .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el
# environment
HISTSIZE = 1000
# default
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# default
COMPILE.s = $(AS) $(ASFLAGS) $(TARGET_MACH)
# default
.INCLUDE_DIRS = /usr/include /usr/local/include /usr/include
# default
.RECIPEPREFIX := 
# default
MAKEINFO = makeinfo
# default
OBJC = cc
# default
TEX = tex
# environment
LANG = en_US.UTF-8
# environment
TERM = screen
# default
F77FLAGS = $(FFLAGS)
# default
LINK.f = $(FC) $(FFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# variable set hash-table stats:
# Load=127/1024=12%, Rehash=0, Collisions=15/172=9%

# Pattern-specific Variable Values

# No pattern-specific variable values.

# Directories

# SCCS: could not be stat'd.
# . (device 64768, inode 114056006): 4 files, 19 impossibilities.
# RCS: could not be stat'd.

# 4 files, 19 impossibilities in 3 directories.

# Implicit Rules

%.out:

%.a:

%.ln:

%.o:

%: %.o
#  recipe to execute (built-in):
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.c:

%: %.c
#  recipe to execute (built-in):
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.ln: %.c
#  recipe to execute (built-in):
	$(LINT.c) -C$* $<

%.o: %.c
#  recipe to execute (built-in):
	$(COMPILE.c) $(OUTPUT_OPTION) $<

%.cc:

%: %.cc
#  recipe to execute (built-in):
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.cc
#  recipe to execute (built-in):
	$(COMPILE.cc) $(OUTPUT_OPTION) $<

%.C:

%: %.C
#  recipe to execute (built-in):
	$(LINK.C) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.C
#  recipe to execute (built-in):
	$(COMPILE.C) $(OUTPUT_OPTION) $<

%.cpp:

%: %.cpp
#  recipe to execute (built-in):
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.cpp
#  recipe to execute (built-in):
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<

%.p:

%: %.p
#  recipe to execute (built-in):
	$(LINK.p) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.p
#  recipe to execute (built-in):
	$(COMPILE.p) $(OUTPUT_OPTION) $<

%.f:

%: %.f
#  recipe to execute (built-in):
	$(LINK.f) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.f
#  recipe to execute (built-in):
	$(COMPILE.f) $(OUTPUT_OPTION) $<

%.F:

%: %.F
#  recipe to execute (built-in):
	$(LINK.F) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.F
#  recipe to execute (built-in):
	$(COMPILE.F) $(OUTPUT_OPTION) $<

%.f: %.F
#  recipe to execute (built-in):
	$(PREPROCESS.F) $(OUTPUT_OPTION) $<

%.m:

%: %.m
#  recipe to execute (built-in):
	$(LINK.m) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.m
#  recipe to execute (built-in):
	$(COMPILE.m) $(OUTPUT_OPTION) $<

%.r:

%: %.r
#  recipe to execute (built-in):
	$(LINK.r) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.r
#  recipe to execute (built-in):
	$(COMPILE.r) $(OUTPUT_OPTION) $<

%.f: %.r
#  recipe to execute (built-in):
	$(PREPROCESS.r) $(OUTPUT_OPTION) $<

%.y:

%.ln: %.y
#  recipe to execute (built-in):
	$(YACC.y) $< 
	 $(LINT.c) -C$* y.tab.c 
	 $(RM) y.tab.c

%.c: %.y
#  recipe to execute (built-in):
	$(YACC.y) $< 
	 mv -f y.tab.c $@

%.l:

%.ln: %.l
#  recipe to execute (built-in):
	@$(RM) $*.c
	 $(LEX.l) $< > $*.c
	$(LINT.c) -i $*.c -o $@
	 $(RM) $*.c

%.c: %.l
#  recipe to execute (built-in):
	@$(RM) $@ 
	 $(LEX.l) $< > $@

%.r: %.l
#  recipe to execute (built-in):
	$(LEX.l) $< > $@ 
	 mv -f lex.yy.r $@

%.ym:

%.m: %.ym
#  recipe to execute (built-in):
	$(YACC.m) $< 
	 mv -f y.tab.c $@

%.yl:

%.s:

%: %.s
#  recipe to execute (built-in):
	$(LINK.s) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.s
#  recipe to execute (built-in):
	$(COMPILE.s) -o $@ $<

%.S:

%: %.S
#  recipe to execute (built-in):
	$(LINK.S) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.S
#  recipe to execute (built-in):
	$(COMPILE.S) -o $@ $<

%.s: %.S
#  recipe to execute (built-in):
	$(PREPROCESS.S) $< > $@

%.mod:

%: %.mod
#  recipe to execute (built-in):
	$(COMPILE.mod) -o $@ -e $@ $^

%.o: %.mod
#  recipe to execute (built-in):
	$(COMPILE.mod) -o $@ $<

%.sym:

%.def:

%.sym: %.def
#  recipe to execute (built-in):
	$(COMPILE.def) -o $@ $<

%.h:

%.info:

%.dvi:

%.tex:

%.dvi: %.tex
#  recipe to execute (built-in):
	$(TEX) $<

%.texinfo:

%.info: %.texinfo
#  recipe to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

%.dvi: %.texinfo
#  recipe to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

%.texi:

%.info: %.texi
#  recipe to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

%.dvi: %.texi
#  recipe to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

%.txinfo:

%.info: %.txinfo
#  recipe to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

%.dvi: %.txinfo
#  recipe to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

%.w:

%.c: %.w
#  recipe to execute (built-in):
	$(CTANGLE) $< - $@

%.tex: %.w
#  recipe to execute (built-in):
	$(CWEAVE) $< - $@

%.ch:

%.web:

%.p: %.web
#  recipe to execute (built-in):
	$(TANGLE) $<

%.tex: %.web
#  recipe to execute (built-in):
	$(WEAVE) $<

%.sh:

%: %.sh
#  recipe to execute (built-in):
	cat $< >$@ 
	 chmod a+x $@

%.elc:

%.el:

(%): %
#  recipe to execute (built-in):
	$(AR) $(ARFLAGS) $@ $<

%.out: %
#  recipe to execute (built-in):
	@rm -f $@ 
	 cp $< $@

%.c: %.w %.ch
#  recipe to execute (built-in):
	$(CTANGLE) $^ $@

%.tex: %.w %.ch
#  recipe to execute (built-in):
	$(CWEAVE) $^ $@

%:: %,v
#  recipe to execute (built-in):
	$(CHECKOUT,v)

%:: RCS/%,v
#  recipe to execute (built-in):
	$(CHECKOUT,v)

%:: RCS/%
#  recipe to execute (built-in):
	$(CHECKOUT,v)

%:: s.%
#  recipe to execute (built-in):
	$(GET) $(GFLAGS) $(SCCS_OUTPUT_OPTION) $<

%:: SCCS/s.%
#  recipe to execute (built-in):
	$(GET) $(GFLAGS) $(SCCS_OUTPUT_OPTION) $<

# 92 implicit rules, 5 (5.4%) terminal.

# Files

# Not a target:
.web.p:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(TANGLE) $<

# Not a target:
.l.r:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LEX.l) $< > $@ 
	 mv -f lex.yy.r $@

# Not a target:
.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.ym:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.f.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.f) $(OUTPUT_OPTION) $<

# Not a target:
.l:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.m:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.m) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.y:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.def.sym:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.def) -o $@ $<

# Not a target:
.p.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.p) $(OUTPUT_OPTION) $<

# Not a target:
.p:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.p) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.txinfo.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

# Not a target:
.a:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.yl:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.l.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	@$(RM) $*.c
	 $(LEX.l) $< > $*.c
	$(LINT.c) -i $*.c -o $@
	 $(RM) $*.c

# Not a target:
.F.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.F) $(OUTPUT_OPTION) $<

# Not a target:
.texi.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

# Not a target:
.w.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(CTANGLE) $< - $@

# Not a target:
.texi.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

# Not a target:
.ch:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.m.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.m) $(OUTPUT_OPTION) $<

# Not a target:
.cc:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.cc.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.cc) $(OUTPUT_OPTION) $<

# Not a target:
.def:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.SUFFIXES: .out .a .ln .o .c .cc .C .cpp .p .f .F .m .r .y .l .ym .yl .s .S .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.c.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.c) $(OUTPUT_OPTION) $<

# Not a target:
Makefile:
#  Implicit rule search has been done.
#  Last modified 2023-04-12 23:50:15.4606247
#  File has been updated.
#  Successfully updated.

# Not a target:
.r.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.r) $(OUTPUT_OPTION) $<

# Not a target:
.r:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.r) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.ym.m:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(YACC.m) $< 
	 mv -f y.tab.c $@

# Not a target:
.y.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(YACC.y) $< 
	 $(LINT.c) -C$* y.tab.c 
	 $(RM) y.tab.c

# Not a target:
.elc:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.l.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	@$(RM) $@ 
	 $(LEX.l) $< > $@

# Not a target:
.out:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

all:
#  Implicit rule search has not been done.
#  Implicit/static pattern stem: `'
#  File does not exist.
#  File has been updated.
#  Successfully updated.
# automatic
# @ := all
# automatic
# % := 
# automatic
# * := 
# automatic
# + := 
# automatic
# | := 
# automatic
# < := 
# automatic
# ^ := 
# automatic
# ? := 
# variable set hash-table stats:
# Load=8/32=25%, Rehash=0, Collisions=2/32=6%
#  recipe to execute (from `Makefile', line 4):
	@echo $(MAKE_VERSION)
	@echo $(CURDIR)
	@echo $(MAKEFILE_LIST)
	@echo $(MAKECMDGOALS)
	@echo "$(.VARIABLES)"
	@echo "$(.VARIABLES)" | tr ' ' '\015' | grep MAKEF

# Not a target:
.C:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.C) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.r.f:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(PREPROCESS.r) $(OUTPUT_OPTION) $<

# Not a target:
.S:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.S) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.texinfo.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

# Not a target:
.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.w.tex:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(CWEAVE) $< - $@

# Not a target:
.c.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINT.c) -C$* $<

# Not a target:
.s.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.s) -o $@ $<

# Not a target:
.s:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.s) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.texinfo.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

# Not a target:
.el:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.lm.m:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	@$(RM) $@ 
	 $(LEX.m) $< > $@

# Not a target:
.y.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(YACC.y) $< 
	 mv -f y.tab.c $@

# Not a target:
.web.tex:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(WEAVE) $<

# Not a target:
.texinfo:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.DEFAULT:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.h:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.tex.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(TEX) $<

# Not a target:
.cpp.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<

# Not a target:
.cpp:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.C.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.C) $(OUTPUT_OPTION) $<

# Not a target:
.texi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.txinfo:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.tex:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.txinfo.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

# Not a target:
.sh:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	cat $< >$@ 
	 chmod a+x $@

# Not a target:
.S.s:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(PREPROCESS.S) $< > $@

# Not a target:
.mod:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.mod) -o $@ -e $@ $^

# Not a target:
.mod.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.mod) -o $@ $<

# Not a target:
.F.f:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(PREPROCESS.F) $(OUTPUT_OPTION) $<

# Not a target:
.w:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.S.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(COMPILE.S) -o $@ $<

# Not a target:
.F:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.F) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.web:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.sym:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.f:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (built-in):
	$(LINK.f) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# files hash-table stats:
# Load=74/1024=7%, Rehash=0, Collisions=417/1479=28%
# VPATH Search Paths

# No `vpath' search paths.

# No general (`VPATH' variable) search path.

# # of strings in strcache: 0 / lookups = 432 / hits = 432
# # of strcache buffers: 1 (* 8176 B/buffer = 8176 B)
# strcache used: total = 0 (2468) / max = 0 / min = 8176 / avg = 0
# strcache free: total = 0 (5708) / max = 0 / min = 8176 / avg = 0

# strcache hash-table stats:
# Load=241/8192=3%, Rehash=0, Collisions=177/432=41%
# Finished Make data base on Wed Apr 12 23:51:50 2023

