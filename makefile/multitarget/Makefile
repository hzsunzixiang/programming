

#  用到了函数库flex  aptitude install flex flexc++

CC=gcc
#CFLAGS=-Wall -g
#CFLAGS=-Wall
BIN=mmap_write mmap_read
OBJ=count_words


.PHONY:clean all
all:$(BIN) $(OBJ)

# 可以单独定义依赖选项
mmap_write: CFLAGS = -Wall -g
mmap_read: CFLAGS = -Wall -g


# 具体过程可以参看静态模式匹配 同时用到 没有后缀的模式规则
# 对每个目标单独定义默认规则
$(BIN): %: %.c
	$(CC) $(CFLAGS)  $< -o $@
# lexer.o 会利用默认规则 通过lexer.l生成lexer.c 然后生成lexer.o
$(OBJ): %: %.c lexer.o
	$(CC) $(CFLAGS)  $^ -lfl  -o $@
clean:
	rm -f *.o mmap_write  mmap_read count_words

#4.12.1 Syntax of Static Pattern Rules
#
#Here is the syntax of a static pattern rule:
#
#targets …: target-pattern: prereq-patterns …
#        recipe
#        …

