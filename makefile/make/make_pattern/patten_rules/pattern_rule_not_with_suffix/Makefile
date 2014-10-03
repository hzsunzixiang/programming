VPATH=lib
objects = foo bar lib/zoo

CFLAGS=-Wall -g
#%.o: %.cpp
# 这里只有一个百分号，默认是生成可执行文件的,即linux下的可执行文件一般没有后缀
% : %.cpp
	# CPP是预编译处理器 这里只是做区分，不去深入探讨工具
	g++  $(CFLAGS) $(CPPFLAGS) $< -o $@

#% : %.c
#	$(CC)   $(CFLAGS) $(CPPFLAGS) $< -o $@

# 其实也可以生成不带.o的目标文件，但容易引起误解，一般不这么做
# 这里规则是任意制定的,所以规则比较灵活,其实就是百分号%完全匹配，没有后缀，也就是这里 $@
% : %.c
	$(CC)  -c  $(CFLAGS) $(CPPFLAGS) $< -o $@

# 上面的规则，已经包含了下面这条规则，所以不需要了，而且不会覆盖上面的规则
#lib/%.o: lib/%.c
#	$(CC)  $< -o $@

# 关于静态模式匹配 参看另外章节
#$(objects): %.o: %.c
#	$(CC) -c $(CFLAGS) $< -o $@

all: $(objects)

.PHONEY:clean
clean:
	rm  -f foo bar lib/zoo

