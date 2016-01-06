#!/bin/bash1



bar() { echo "test bar called----------------"; } 
export -f bar   # 少了这一行不能执行下面的命令 bar在新的shell里面看不到 bar这个函数
bash1 -c "env; echo "+++++"; bar"



# 这种形式也 可以
#env x='() { :;}; echo vulnerable' bash1 -c "env;echo this is a test"
test_func='() { echo "test_func called"; }' bash1 -c "env; echo ""; test_func"


# # 下面通不过
# test_func='() { echo "test_func called"; }'
# export -f test_func
# bash1 -c "env; echo "-------"; test_func"



#test_func

