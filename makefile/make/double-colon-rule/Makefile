# makefile for "circle" to demonstrate double-colon rules.

CC = gcc
RM = rm -rf
CFLAGS = -Wall -std=c99
DBGFLAGS = -ggdb -pg
DEBUGFILE = ./debug
SRC = circle.c

circle :: $(SRC)
	$(CC) $(CFLAGS) -o $@ -lm $^

circle :: $(DEBUGFILE)
	$(CC) $(CFLAGS) $(DBGFLAGS) -o $@ -lm $(SRC)



.PHONY : clean

clean  :
	$(RM) circle




#circle : $(SRC)
#	$(CC) $(CFLAGS) -o $@ -lm $^
#
#circle : $(DEBUGFILE)
#	$(CC) $(CFLAGS) $(DBGFLAGS) -o $@ -lm $(SRC)
## 如果改成单引号则会有警告
#ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make
#Makefile:20: warning: overriding recipe for target `circle'
#Makefile:17: warning: ignoring old recipe for target `circle'
#gcc -Wall -std=c99 -ggdb -pg -o circle -lm circle.c
