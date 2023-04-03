# 没看出来 override 的作用
CFLAGS = xxxx
#override CFLAGS += -g
CFLAGS += -g
main:
	@echo $(CFLAGS)
