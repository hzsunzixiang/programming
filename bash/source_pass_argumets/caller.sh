

echo var:"$*"
source callee.sh
source callee.sh $*
source callee.sh $1
source callee.sh ""
source callee.sh $*


# StephenSun@debian:~/programming/bash/source_pass_argumets$ ./caller.sh 1 2 3
# var:1 2 3
# yy var:1 2 3
# yy var:1 2 3
# yy var:1
# yy var:
# yy var:1 2 3

#	source allows you to execute a command in the current context (arguments $* are part of context).
#	
#	The second source call overwrites these arguments. Note it overwrites them only for the call, they are restored right after.
