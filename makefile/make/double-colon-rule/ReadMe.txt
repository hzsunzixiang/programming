https://stackoverflow.com/questions/7891097/what-are-double-colon-rules-in-a-makefile-for


## 两个 target同时运行，其中一个报错
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make
gcc -Wall -std=c99 -o circle -lm circle.c
make: *** No rule to make target `debug', needed by `circle'.  Stop.

##  创建依赖文件
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ touch debug

## 再次执行
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make
gcc -Wall -std=c99 -ggdb -pg -o circle -lm circle.c

## 清理掉
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make clean
rm -rf circle

## 这时候可以构建
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make
gcc -Wall -std=c99 -o circle -lm circle.c
gcc -Wall -std=c99 -ggdb -pg -o circle -lm circle.c

## 只构建有依赖的部分
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ touch debug
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make
gcc -Wall -std=c99 -ggdb -pg -o circle -lm circle.c

# 如果改成单引号则会有警告
ericksun@centos7-mq1:~/programming/makefile/make/double-colon-rule (master)$ make
Makefile:20: warning: overriding recipe for target `circle'
Makefile:17: warning: ignoring old recipe for target `circle'
gcc -Wall -std=c99 -ggdb -pg -o circle -lm circle.c

