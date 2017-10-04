

# bash 报错 dash 或者sh 不报错
x=1
if [ $x=1 ] 
then 
	:
	continue
	#echo "true"
else
	echo "error"
fi



#StephenSun@debian:~/programming/bash/difference$ dash  if_continue.sh
#StephenSun@debian:~/programming/bash/difference$ bash if_continue.sh
#if_continue.sh: line 7: continue: only meaningful in a `for', `while', or `until' loop
#StephenSun@debian:~/programming/bash/difference$ sh if_continue.sh

