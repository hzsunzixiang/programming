#!/usr/bin/env python
# -*- coding:UTF-8

# 这个算法不错 是欧几里得扩展算法
def extended_gcd(aa, bb):
    lastremainder, remainder = abs(aa), abs(bb)
    x, lastx, y, lasty = 0, 1, 1, 0
    while remainder:
        lastremainder, (quotient, remainder) = remainder, divmod(lastremainder, remainder)
        x, lastx = lastx - quotient*x, x
        y, lasty = lasty - quotient*y, y
    return lastremainder, lastx * (-1 if aa < 0 else 1), lasty * (-1 if bb < 0 else 1)
 
def modinv(a, m):
    g, x, y = extended_gcd(a, m)
    if g != 1:
    	raise ValueError
    return x % m

# ECC 数字签名算法


###########################现在开始选取参数#############################
###  选择的曲线E, 这条曲线的阶为19
p=17
a=2
b=2

### 选择点A(5,1) 选择d=7， 计算B=dA=7(5,1) =(0,6)

## 所以公钥为(p,a,b,q,A,B)=(17,2,2,19,(5,1),(06))
## 私钥为 (d) = (7)

###########################现在开始签名#############################

## 计算消息h(x)=26的哈希值 的签名，用私钥d签名
## 消息h(x) 对签名一方和验证签名的一方都是公开的
## 选择临时密钥K=10
## R=10*(5,1)=(7,11) = (Xr,Yr), 所以r=7
## s = (h(x)+dr)(K^-1)

## 此时 d 和 r 都为 7 是巧合了

## k模19的逆为2
## s = (h(x)+dr)(K^(-1)) = (26+7*7) *2  = 17(mod 19)

## 所以(r,s)=(7,17)

###########################现在开始验证#############################
# 此时 不能知晓私钥 (d) 但公钥B(0,6) 是公开的
##  P=s^(-1)h(x)A+s^(-1)rB

## s的逆 s^(-1) = 17^(-1)=9(mod 19)


P=9*26A+9*7B=6A+6B=6(5,1) + 6(0,6) = (7,11) (mod 19)


#事实上我们可以查表来验证
#P=6p+6(7p) = 48p = 2*19p+10p =10p = (7,11)

# 和签名的过程得到的r=7相等   所以签名正确


