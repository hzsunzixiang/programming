# make -p 中对程序库的默认支持为

#(%): %
##  commands to execute (built-in):
#    $(AR) $(ARFLAGS) $@ $<

#root@debian:~/programming/makefile/make/make_archive# gcc  -Wall count_words.o  -L. -lcounter  -lfl -o count_words
# root@debian:~/programming/makefile/make/make_archive# gcc  -Wall count_words.o  libcounter.a   -lfl -o count_words


VPATH=src common include
CPPFLAGS=-I inlcude

count_words:libcounter.a  -lfl

# 此时不能使用 -lcounter , 因为libcounter作为目标出现了  ??
#count_words: -lcounter  -lfl

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

