#!/bin/bash



# 新版bash修复了这个问题 西面的都通不过测试


# ------------------------- 1 ------------------------
 bar() { echo "test bar called----------------"; } 
 export -f bar   # 少了这一行不能执行下面的命令 bar在新的shell里面看不到 bar这个函数
 bash -c "env; echo "+++++"; bar"
 
 # 修改后的bash 环境变量变为
 
 # BASH_FUNC_bar%%=() {  echo "test bar called----------------"
 # }
 
 # 调用依然会报错
 #bash -c "env; echo "+++++"; BASH_FUNC_bar%%"

# ------------------------- 1 ------------------------



# ------------------------- 2 ------------------------
# 这种形式也不可以
#由于shellshock漏洞，我们这种func_name='() { cmd_list; }'的方式被安全修复了， 没办法通过环境变量赋值这种方式来创建函数了。
#
# 环境变量赋值 变为：  test_func=() { echo "test_func called"; } 注意和函数之间的区别

test_func='() { echo "test_func called"; }' bash -c "env; echo ""; test_func"

# ------------------------- 2 ------------------------

# 下面 更通不过  在老的未修复的版本中也不可以
#test_func='() { echo "test_func called"; }'
#export -f test_func
#bash1 -c "env; echo "-------"; test_func"




#       export [-fn] [name[=word]] ...
#       export -p
#              The  supplied  names are marked for automatic export to the environment of subsequently executed commands.  If the -f option is given, the names refer to functions.  If no
#              names are given, or if the -p option is supplied, a list of all names that are exported in this shell is printed.  The -n option causes the export property to  be  removed
#              from each name.  If a variable name is followed by =word, the value of the variable is set to word.  export returns an exit status of 0 unless an invalid option is encoun‐
#              tered, one of the names is not a valid shell variable name, or -f is supplied with a name that is not a function.
#

