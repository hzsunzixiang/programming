#!/usr/bin/env python
# -*- coding:UTF-8





# 平方乘算法
def square_multi(base, exp):
    init=0  #初始化设置
    result=0
    for b in str(bin(exp)[2:]):
        if (b=='1') and (init==0):
           init=1
           result=base
        elif (b=='1') and (init==1):
           result=result**2
           result=result*base
        else:
           result=result**2
    return result

# 计算 89**26
print square_multi(89,26) 
#print (x2,y2) 
