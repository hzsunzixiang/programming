.PHONY:clean all
CC=gcc
# 演示 阻塞模式
CFLAGS=-Wall -g -DBLOCK
# 演示非阻塞模式
#CFLAGS=-Wall -g
BIN=locked_files pseudo-files
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

