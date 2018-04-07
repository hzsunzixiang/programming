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


# 必须得用算法才可以 不能这么蛮力
#  Q ← 0
#   for j ← i − 1 downto 0 do
#       Q ← point_double(Q)
#       if (dj != 0)
#           Q ← point_add(Q, djG)
#   return Q

#for i in range(2,priv):

p=17
a=2
b=2


# 然后用 算法实现
#i=0
def ecc_double(x1,y1):
    s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    x3=(s**2-x1-x1)%p
    y3=(s*(x1-x3)-y1)%p
    return (x3,y3)
#print ecc_double(x1,y1)

def ecc_add(x1,y1,x2,y2):
    s = 0
    if (x1==x2):
        s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    else:
        s=((y2-y1)*modinv(x2-x1,p))%p
    x3=(s**2-x1-x2)%p
    y3=(s*(x1-x3)-y1)%p
    return (x3,y3)
#print ecc_add(x1,y1,x2,y2)

# 以 13 = b(1101) 为例

x1=5
y1=1
#print ecc_double(x1,y1)
#exit(0)
#print str(bin(priv)).replace("0b","")
(x3,y3)=(0,0)
(x_tmp,y_tmp)=(x1,y1)
init=0  #初始化设置
for b in str(bin(13)[2:]):
    #print b
    if (b=='1') and (init==0):
       init=1
    elif (b=='1') and (init==1):
       print "start:", (x_tmp, y_tmp)
       (x3,y3)=ecc_double(x_tmp,y_tmp)
       print  "if   double and add double:", (x3,y3)
       (x3,y3)=ecc_add(x1,y1,x3,y3)
       (x_tmp, y_tmp) = (x3,y3)
       print  "if   double and add    add:", (x3,y3)
    else:
       print "start:", (x_tmp, y_tmp)
       (x3,y3)=ecc_double(x_tmp,y_tmp)
       print  "else double and add double:", (x3,y3)
       print (x3,y3)
       (x_tmp, y_tmp) = (x3,y3)
print (x3,y3) 
#print (x2,y2) 
