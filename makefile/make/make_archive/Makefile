# make -p 中对程序库的默认支持为

#(%): %
##  commands to execute (built-in):
#    $(AR) $(ARFLAGS) $@ $<

#root@debian:~/programming/makefile/make/make_archive# gcc  -Wall count_words.o  -L. -lcounter  -lfl -o count_words
# root@debian:~/programming/makefile/make/make_archive# gcc  -Wall count_words.o  libcounter.a   -lfl -o count_words


VPATH=src common include
CPPFLAGS=-I inlcude

count_words:libcounter.a  -lfl
# count_words: -lcounter  -lfl
# make: *** No rule to make target `-lcounter', needed by `count_words'.  Stop.
# 此时不能使用 -lcounter , 因为libcounter作为目标出现了  ??
# Unfortunately, there is a small wrinkle. If a makefile specifies a library file target, it
# cannot use the -l option for that file in a prerequisite. For instance, the following
# makefile:
# count_words: count_words.o -lcounter -lfl
# $(CC) $^ -o $@
# libcounter.a: libcounter.a(lexer.o) libcounter.a(counter.o)
# fails with the error:
# No rule to make target `-lcounter', needed by `count_words'
# It appears that this error occurs because make does not expand -lcounter to
# libcounter.a and search for a target, but instead does a straight library search. So for
# libraries built within the makefile, the filename form must be used.
#

libcounter.a:libcounter.a(lexer.o) libcounter.a(counter.o)

# 为程序库建立索引，貌似不起作用
#	$(RANLIB) $@

libcounter.a(lexer.o):lexer.o
	#$(AR) $(ARFLAGS) $@ $<
	# $? 表示时间戳在工作目标之后的目标文件
	$(AR) $(ARFLAGS) $@ $?

libcounter.a(countr.o):counter.o
	$(AR) $(ARFLAGS) $@ $<

count_words.o:counter.h

counter.o:counter.h lexer.h

lexer.o:lexer.h

.PHONY:clean
clean:
	rm -f *.o src/lexer.c  count_words *.a

