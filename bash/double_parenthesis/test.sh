


#       ((expression))
#              The expression is evaluated according to the rules described below under  ARITHMETIC  EVALUATION.   If  the  value  of  the
#              expression  is  non-zero,  the  return  status  is  0; otherwise the return status is 1.  This is exactly equivalent to let
#              "expression".
#
# 表达式求值

a=100

((a=a+11))

echo $?  # 表达式不为零 返回 0
echo $a

((a=a-111))

echo $?  # 表达式为0 返回1
echo $a

#StephenSun@debian-1:~/programming/bash/double_parenthesis$ bash test.sh 
#0
#111
#1
#0
#echo `((a=a+1))`
