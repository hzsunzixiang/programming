#!/usr/bin/env python
# -*- coding:UTF-8


# 这个曲线的阶 是 14+1 = 15 不是素数，所以并不是所有的点都是生成元
p=2111
a=20
b=13

# calc
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


# (11,13) 这个点是生成元
x1=x2=3
y1=y2=10
print str(1)+"p:\t", (x1,y1)

def generator1(x1, y1, x2, y2):
    i = 2
    while(True):
        s = 0
        if (x1==x2 and  y1!=y2):
            print "loop break"  
            break
        if (x1==x2):
            s=((3*(x1**2)+a)*modinv(2*y1,p))%p
        else:
            s=((y2-y1)*modinv(x2-x1,p))%p
        x3=(s**2-x1-x2)%p
        y3=(s*(x1-x3)-y1)%p
        print str(i)+"p:\t", (x3,y3)
        (x2,y2)=(x3,y3)
        i=i+1
generator1(x1, y1, x2 , y2)

print "\n\n\n\n"
# (0,1) 这个点是生成元
x1=x2=0
y1=y2=1
generator1(x1, y1, x2 , y2)
