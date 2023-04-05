#!/bin/sh
gnulib-tool --update
autoreconf -i

# 不知道为啥缺个头文件
# cp ../gnulib/lib/intprops.h lib

