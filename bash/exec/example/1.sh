#!/bin/bash  

A=B  
echo "PID for 1.sh before exec/source/fork:$$"  
export A  
echo "1.sh: \$A is $A"  
case $1 in  
        exec)  
                echo "using exec..."  
                exec ./2.sh ;;  
        source)  
                echo "using source..."  
                . ./2.sh ;;  
        *)  
                echo "using fork by default..."  
                bash ./2.sh ;;  
esac  
echo "PID for 1.sh after exec/source/fork:$$"  
echo "1.sh: \$A is $A"  /

# 		Note that the exec builtin command can make redirections take effect in the current shell.
#       exec [-cl] [-a name] [command [arguments]]
#              If command is specified, it replaces the shell.  No new process is created.  The arguments become the arguments to command.
#              If  the  -l option is supplied, the shell places a dash at the beginning of the zeroth argument passed to command.  This is
#              what login(1) does.  The -c option causes command to be executed with an empty environment.  If -a is supplied,  the  shell
#              passes  name as the zeroth argument to the executed command.  If command cannot be executed for some reason, a non-interac‐
#              tive shell exits, unless the execfail shell option is enabled.  In that case, it returns  failure.   An  interactive  shell
#              returns  failure  if the file cannot be executed.  If command is not specified, any redirections take effect in the current
#              shell, and the return status is 0.  If there is a redirection error, the return status is 1.
#
# sh：父进程会fork一个子进程，shell script在子进程中执行
# 
# 
# source:在原进程中执行，不会fork子进程
# 
# 
# exec:在原进程中执行，但是同时会终止原进程

# shell 的内件命令exec执行命令时，不启用新的shell进程【注： source 和 . 不启用新的shell，在当前shell中执行，设定的局部变量在执行完命令后仍然有效；bash或sh 或shell script执行时，另起一个子shell,其继承父shell的环境变量，其子shelll的变量执行完后不影响父shell，注意三类的区别】exec是用被执行的命令行替换掉当前的shell进程，且exec命令后的其他命令将不再执行。例如在当前shell中执行 exec ls 表示执行ls这条命令来替换当前的shell  即为执行完后会退出当前shell。为了避免这个结果的影响，一般将exec命令放到一个shell脚本中，用主脚本调用这个脚本，调用处可以用bash  xx.sh(xx.sh为存放exec命令的脚本)。这样会为xx.sh建立一个子shell去执行，当执行exec后该子脚本进程就被替换成相应的exec的命令
# 
# 其中有一个例外：当exec命令对文件描述符操作的时候，就不会替换shell，而是操作完成后还会继续执行后面的命令
