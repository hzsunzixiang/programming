#!/usr/bin/env python
# -*- coding:UTF-8


#https://www.entrust.com/wp-content/uploads/2014/03/WP_Entrust_Zero-to-ECC_March2014.pdf
#这篇文章告诉我们 不是所有的点都是生成元
#Not all points are generators, however
#
#但是如果群的阶是素数，那么除了0点之外每个点都是生成元
#But, if the order of the group is a prime number, then every point is a
#multiple of every other point except the point at infinity


# 这个曲线的阶 是 14+1 = 15 不是素数，所以并不是所有的点都是生成元
p=23
a=3
b=1

def modInverse(a, m) :
    a = a % m;
    for x in range(1, m) :
        if ((a * x) % m == 1) :
            return x
    return 1

# calc


# (11,13) 这个点是生成元
x1=x2=11
y1=y2=13
order=15
print str(1)+"p:\t", (x1,y1)
def generator(x1, y1, x2, y2, begin,order):
    for i in range(begin,order):
        s = 0
        if (x1==x2 and  y1!=y2):
            print "loop break"  
            break
        if (x1==x2):
            s=((3*(x1**2)+a)*modInverse(2*y1,p))%p
        else:
            s=((y2-y1)*modInverse(x2-x1,p))%p
        x3=(s**2-x1-x2)%p
        y3=(s*(x1-x3)-y1)%p
        print str(i)+"p:\t", (x3,y3)
        (x2,y2)=(x3,y3)

def generator1(x1, y1, x2, y2):
    i = 2
    while(True):
        s = 0
        if (x1==x2 and  y1!=y2):
            print "loop break"  
            break
        if (x1==x2):
            s=((3*(x1**2)+a)*modInverse(2*y1,p))%p
        else:
            s=((y2-y1)*modInverse(x2-x1,p))%p
        x3=(s**2-x1-x2)%p
        y3=(s*(x1-x3)-y1)%p
        print str(i)+"p:\t", (x3,y3)
        (x2,y2)=(x3,y3)
        i=i+1
#generator(x1, y1, x2 , y2, 2,order)
generator1(x1, y1, x2 , y2)

print "\n\n\n\n"
# (0,1) 这个点是生成元
x1=x2=0
y1=y2=1
#generator(x1, y1, x2 , y2, 2,order)
generator1(x1, y1, x2 , y2)
