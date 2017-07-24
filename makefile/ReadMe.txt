-p, --print-data-base
   Print the data base (rules and variable values) that results from reading the makefiles; then execute as usual or  as  other‐
   wise specified.  This also prints the version information given by the -v switch (see below).  To print the data base without
   trying to remake any files, use make -p -f/dev/null.
`
### 比如# Implicit Rules



# GNU Make 3.81
# Copyright (C) 2006  Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.
# There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

# This program built for x86_64-pc-linux-gnu

# Make data base, printed on Mon Jul 24 14:50:12 2017

# Variables

# automatic
<D = $(patsubst %/,%,$(dir $<))
# automatic
?F = $(notdir $?)
# default
CWEAVE = cweave
# automatic
?D = $(patsubst %/,%,$(dir $?))
# automatic
@D = $(patsubst %/,%,$(dir $@))
# automatic
@F = $(notdir $@)
# default
MAKE_VERSION := 3.81
# makefile
CURDIR := /home/StephenSun/programming/makefile
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
LINK.o = $(CC) $(LDFLAGS) $(TARGET_ARCH)
# default
OUTPUT_OPTION = -o $@
# default
COMPILE.cpp = $(COMPILE.cc)
# makefile
MAKEFILE_LIST := 
# default
LINK.p = $(PC) $(PFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# default
CC = cc
# default
CHECKOUT,v = +$(if $(wildcard $@),,$(CO) $(COFLAGS) $< $@)
# default
CPP = $(CC) -E
# default
LINK.cc = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# environment
SSH_CONNECTION = 192.168.1.101 63159 192.168.1.105 22
# environment
PATH = /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/hzsunzixiang/program/oz-install/bin
# default
LD = ld
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
# default
LINT = lint
# default
COMPILE.f = $(FC) $(FFLAGS) $(TARGET_ARCH) -c
# default
LINT.c = $(LINT) $(LINTFLAGS) $(CPPFLAGS) $(TARGET_ARCH)
# default
YACC.y = $(YACC) $(YFLAGS)
# default
AR = ar
# default
.FEATURES := target-specific order-only second-expansion else-if archives jobserver check-symlink
# default
TANGLE = tangle
# environment
LS_COLORS = rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
# default
GET = get
# automatic
%F = $(notdir $%)
# default
COMPILE.F = $(FC) $(FFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# default
CTANGLE = ctangle
# environment
TMUX_PANE = %58
# default
.LIBPATTERNS = lib%.so lib%.a
# default
LINK.C = $(LINK.cc)
# environment
PWD = /home/StephenSun/programming/makefile
# default
LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_MACH)
# default
PREPROCESS.r = $(FC) $(FFLAGS) $(RFLAGS) $(TARGET_ARCH) -F
# automatic
*D = $(patsubst %/,%,$(dir $*))
# default
LINK.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# default
LINK.s = $(CC) $(ASFLAGS) $(LDFLAGS) $(TARGET_MACH)
# environment
HOME = /home/StephenSun
# environment
LOGNAME = StephenSun
# automatic
^D = $(patsubst %/,%,$(dir $^))
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
XDG_SESSION_ID = 1
# environment
USER = StephenSun
# default
FC = f77
# makefile
.DEFAULT_GOAL := 
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
OLDPWD = /home/StephenSun/programming/makefile/practice
# default
.VARIABLES := 
# default
PC = pc
# automatic
*F = $(notdir $*)
# environment
LANGUAGE = en_US:en
# default
COMPILE.def = $(M2C) $(M2FLAGS) $(DEFFLAGS) $(TARGET_ARCH)
# default
LEX = lex
# makefile
MAKEFLAGS = p
# environment
MFLAGS = -p
# environment
SSH_CLIENT = 192.168.1.103 64436 22
# environment
MAIL = /var/mail/StephenSun
# default
LEX.l = $(LEX) $(LFLAGS) -t
# automatic
+D = $(patsubst %/,%,$(dir $+))
# default
COMPILE.r = $(FC) $(FFLAGS) $(RFLAGS) $(TARGET_ARCH) -c
# environment
TMUX = /tmp/tmux-1001/default,857,0
# automatic
+F = $(notdir $+)
# default
M2C = m2c
# default
MAKEFILES := 
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
# default
COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_MACH) -c
# default
LINK.F = $(FC) $(FFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
# default
SUFFIXES := .out .a .ln .o .c .cc .C .cpp .p .f .F .r .y .l .s .S .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el
# default
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
# default
COMPILE.s = $(AS) $(ASFLAGS) $(TARGET_MACH)
# default
.INCLUDE_DIRS = /usr/include /usr/local/include /usr/include
# environment
MAKELEVEL := 0
# default
MAKEINFO = makeinfo
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
# Load=107/1024=10%, Rehash=0, Collisions=9/131=7%

# Pattern-specific Variable Values

# No pattern-specific variable values.

# Directories

# SCCS: could not be stat'd.
# . (device 2056, inode 1053690): 8 files, 51 impossibilities.
# RCS: could not be stat'd.

# 8 files, 51 impossibilities in 3 directories.

# Implicit Rules

%.out:

%.a:

%.ln:

%.o:

%: %.o
#  commands to execute (built-in):
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.c:

%: %.c
#  commands to execute (built-in):
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.ln: %.c
#  commands to execute (built-in):
	$(LINT.c) -C$* $<

%.o: %.c
#  commands to execute (built-in):
	$(COMPILE.c) $(OUTPUT_OPTION) $<

%.cc:

%: %.cc
#  commands to execute (built-in):
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.cc
#  commands to execute (built-in):
	$(COMPILE.cc) $(OUTPUT_OPTION) $<

%.C:

%: %.C
#  commands to execute (built-in):
	$(LINK.C) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.C
#  commands to execute (built-in):
	$(COMPILE.C) $(OUTPUT_OPTION) $<

%.cpp:

%: %.cpp
#  commands to execute (built-in):
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.cpp
#  commands to execute (built-in):
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<

%.p:

%: %.p
#  commands to execute (built-in):
	$(LINK.p) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.p
#  commands to execute (built-in):
	$(COMPILE.p) $(OUTPUT_OPTION) $<

%.f:

%: %.f
#  commands to execute (built-in):
	$(LINK.f) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.f
#  commands to execute (built-in):
	$(COMPILE.f) $(OUTPUT_OPTION) $<

%.F:

%: %.F
#  commands to execute (built-in):
	$(LINK.F) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.F
#  commands to execute (built-in):
	$(COMPILE.F) $(OUTPUT_OPTION) $<

%.f: %.F
#  commands to execute (built-in):
	$(PREPROCESS.F) $(OUTPUT_OPTION) $<

%.r:

%: %.r
#  commands to execute (built-in):
	$(LINK.r) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.r
#  commands to execute (built-in):
	$(COMPILE.r) $(OUTPUT_OPTION) $<

%.f: %.r
#  commands to execute (built-in):
	$(PREPROCESS.r) $(OUTPUT_OPTION) $<

%.y:

%.ln: %.y
#  commands to execute (built-in):
	$(YACC.y) $< 
	$(LINT.c) -C$* y.tab.c 
	$(RM) y.tab.c

%.c: %.y
#  commands to execute (built-in):
	$(YACC.y) $< 
	mv -f y.tab.c $@

%.l:

%.ln: %.l
#  commands to execute (built-in):
	@$(RM) $*.c
	$(LEX.l) $< > $*.c
	$(LINT.c) -i $*.c -o $@
	$(RM) $*.c

%.c: %.l
#  commands to execute (built-in):
	@$(RM) $@ 
	$(LEX.l) $< > $@

%.r: %.l
#  commands to execute (built-in):
	$(LEX.l) $< > $@ 
	mv -f lex.yy.r $@

%.s:

%: %.s
#  commands to execute (built-in):
	$(LINK.s) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.s
#  commands to execute (built-in):
	$(COMPILE.s) -o $@ $<

%.S:

%: %.S
#  commands to execute (built-in):
	$(LINK.S) $^ $(LOADLIBES) $(LDLIBS) -o $@

%.o: %.S
#  commands to execute (built-in):
	$(COMPILE.S) -o $@ $<

%.s: %.S
#  commands to execute (built-in):
	$(PREPROCESS.S) $< > $@

%.mod:

%: %.mod
#  commands to execute (built-in):
	$(COMPILE.mod) -o $@ -e $@ $^

%.o: %.mod
#  commands to execute (built-in):
	$(COMPILE.mod) -o $@ $<

%.sym:

%.def:

%.sym: %.def
#  commands to execute (built-in):
	$(COMPILE.def) -o $@ $<

%.h:

%.info:

%.dvi:

%.tex:

%.dvi: %.tex
#  commands to execute (built-in):
	$(TEX) $<

%.texinfo:

%.info: %.texinfo
#  commands to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

%.dvi: %.texinfo
#  commands to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

%.texi:

%.info: %.texi
#  commands to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

%.dvi: %.texi
#  commands to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

%.txinfo:

%.info: %.txinfo
#  commands to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

%.dvi: %.txinfo
#  commands to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

%.w:

%.c: %.w
#  commands to execute (built-in):
	$(CTANGLE) $< - $@

%.tex: %.w
#  commands to execute (built-in):
	$(CWEAVE) $< - $@

%.ch:

%.web:

%.p: %.web
#  commands to execute (built-in):
	$(TANGLE) $<

%.tex: %.web
#  commands to execute (built-in):
	$(WEAVE) $<

%.sh:

%: %.sh
#  commands to execute (built-in):
	cat $< >$@ 
	chmod a+x $@

%.elc:

%.el:

(%): %
#  commands to execute (built-in):
	$(AR) $(ARFLAGS) $@ $<

%.out: %
#  commands to execute (built-in):
	@rm -f $@ 
	cp $< $@

%.c: %.w %.ch
#  commands to execute (built-in):
	$(CTANGLE) $^ $@

%.tex: %.w %.ch
#  commands to execute (built-in):
	$(CWEAVE) $^ $@

%:: %,v
#  commands to execute (built-in):
	$(CHECKOUT,v)

%:: RCS/%,v
#  commands to execute (built-in):
	$(CHECKOUT,v)

%:: RCS/%
#  commands to execute (built-in):
	$(CHECKOUT,v)

%:: s.%
#  commands to execute (built-in):
	$(GET) $(GFLAGS) $(SCCS_OUTPUT_OPTION) $<

%:: SCCS/s.%
#  commands to execute (built-in):
	$(GET) $(GFLAGS) $(SCCS_OUTPUT_OPTION) $<

# 86 implicit rules, 5 (5.8%) terminal.

# Files

# Not a target:
.web.p:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(TANGLE) $<

# Not a target:
.l.r:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LEX.l) $< > $@ 
	mv -f lex.yy.r $@

# Not a target:
.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.F.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.F) $(OUTPUT_OPTION) $<

# Not a target:
.l:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.y.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(YACC.y) $< 
	$(LINT.c) -C$* y.tab.c 
	$(RM) y.tab.c

# Not a target:
.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
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
#  commands to execute (built-in):
	$(COMPILE.def) -o $@ $<

# Not a target:
.p.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.p) $(OUTPUT_OPTION) $<

# Not a target:
.p:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.p) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.txinfo.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

# Not a target:
.a:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.l.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	@$(RM) $*.c
	$(LEX.l) $< > $*.c
	$(LINT.c) -i $*.c -o $@
	$(RM) $*.c

# Not a target:
.w.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(CTANGLE) $< - $@

# Not a target:
.texi.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

# Not a target:
.sh:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	cat $< >$@ 
	chmod a+x $@

# Not a target:
.cc:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.cc.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.cc) $(OUTPUT_OPTION) $<

# Not a target:
.def:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.SUFFIXES: .out .a .ln .o .c .cc .C .cpp .p .f .F .r .y .l .s .S .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.c.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.c) $(OUTPUT_OPTION) $<

# Not a target:
Makefile:
#  A default, MAKEFILES, or -include/sinclude makefile.
#  Implicit rule search has been done.
#  File does not exist.
#  File has been updated.
#  Failed to be updated.
# variable set hash-table stats:
# Load=0/32=0%, Rehash=0, Collisions=0/0=0%

# Not a target:
.r.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.r) $(OUTPUT_OPTION) $<

# Not a target:
.r:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.r) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
makefile:
#  A default, MAKEFILES, or -include/sinclude makefile.
#  Implicit rule search has been done.
#  File does not exist.
#  File has been updated.
#  Failed to be updated.
# variable set hash-table stats:
# Load=0/32=0%, Rehash=0, Collisions=0/0=0%

# Not a target:
.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

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
#  commands to execute (built-in):
	@$(RM) $@ 
	$(LEX.l) $< > $@

# Not a target:
.out:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.C:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.C) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.r.f:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(PREPROCESS.r) $(OUTPUT_OPTION) $<

# Not a target:
.S:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.S) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.texinfo.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

# Not a target:
.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.w.tex:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(CWEAVE) $< - $@

# Not a target:
.c.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINT.c) -C$* $<

# Not a target:
.s.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.s) -o $@ $<

# Not a target:
.s:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.s) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.texinfo.dvi:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(TEXI2DVI) $(TEXI2DVI_FLAGS) $<

# Not a target:
.el:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.texinfo:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
.y.c:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(YACC.y) $< 
	mv -f y.tab.c $@

# Not a target:
.web.tex:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(WEAVE) $<

# Not a target:
.texi.info:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

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
#  commands to execute (built-in):
	$(TEX) $<

# Not a target:
.cpp.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<

# Not a target:
.cpp:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.C.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.C) $(OUTPUT_OPTION) $<

# Not a target:
.ln:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

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
#  commands to execute (built-in):
	$(MAKEINFO) $(MAKEINFO_FLAGS) $< -o $@

# Not a target:
.ch:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.

# Not a target:
GNUmakefile:
#  A default, MAKEFILES, or -include/sinclude makefile.
#  Implicit rule search has been done.
#  File does not exist.
#  File has been updated.
#  Failed to be updated.
# variable set hash-table stats:
# Load=0/32=0%, Rehash=0, Collisions=0/0=0%

# Not a target:
.S.s:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(PREPROCESS.S) $< > $@

# Not a target:
.mod:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.mod) -o $@ -e $@ $^

# Not a target:
.mod.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.mod) -o $@ $<

# Not a target:
.F.f:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
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
#  commands to execute (built-in):
	$(COMPILE.S) -o $@ $<

# Not a target:
.F:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
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
#  commands to execute (built-in):
	$(LINK.f) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Not a target:
.f.o:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  commands to execute (built-in):
	$(COMPILE.f) $(OUTPUT_OPTION) $<

# files hash-table stats:
# Load=69/1024=7%, Rehash=0, Collisions=276/1520=18%
# VPATH Search Paths

# No `vpath' search paths.

# No general (`VPATH' variable) search path.

# # of strings in strcache: 0
# # of strcache buffers: 0
# strcache size: total = 0 / max = 0 / min = 4096 / avg = 0
# strcache free: total = 0 / max = 0 / min = 4096 / avg = 0

# Finished Make data base on Mon Jul 24 14:50:12 2017

