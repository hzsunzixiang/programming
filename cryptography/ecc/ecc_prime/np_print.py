#!/usr/bin/env python
# -*- coding:UTF-8


p=17
a=2
b=2
# https://stackoverflow.com/questions/20585920/how-to-add-multiple-values-to-a-dictionary-key-in-python
xlable = dict()
ylable = dict()
def lablex(x):
    xlable.setdefault((x**3+a*x+b)%p,[]).append(x)

def labley(y):
    ylable.setdefault((y**2)%p,[]).append(y)
#https://stackoverflow.com/questions/39322625/how-to-put-python-loop-output-in-a-list
lstx=[]
for num in range(0,p):
    lablex(num)
#print (xlable)

print "\n\n\n"
for num in range(0,p):
    labley(num)

#print (ylable)


# 打印所有的 满足曲线 y^2 = x^3 + x + 10(mod 23)
# 总共18对(x,y) 加上0元素，构成一个阶为q=19的有限循环群
import itertools
intersect = []
for item in xlable.keys():
    if ylable.has_key(item):
        tmp = list(itertools.product(xlable[item], ylable[item]))
        intersect = intersect + tmp;
        #intersect =  [(x,y) for x in xlable[item] for y in ylable[item]]
print sorted(intersect)
print len(intersect)
    



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

## Driver Program
#a = 2
#m = 17
#print(modinv(a, m))


# calc

#[(0, 6), (0, 11), (3, 1), (3, 16), (5, 1), (5, 16), (6, 3), (6, 14), (7, 6), (7, 11), (9, 1), (9, 16), (10, 6), (10, 11), (13, 7), (13, 10), (16, 4), (16, 13)]
#x1=x2=13
#y1=y2=10
x1=x2=5
y1=y2=1
print str(1)+"p:\t", (x1,y1)
for i in range(2,19):
    s = 0
    if (x1==x2):
        s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    else:
        s=((y2-y1)*modinv(x2-x1,p))%p
    x3=(s**2-x1-x2)%p
    y3=(s*(x1-x3)-y1)%p
    print str(i)+"p:\t", (x3,y3)
    (x2,y2)=(x3,y3)


# verify 6p + 12p = 18p
n=(16,13) # 6p
m=(0,11) # 12p
print "6p + 12p = 18p(5,16)"
def nPlusm(n,m):
    x1=n[0]
    y1=n[1]
    x2=m[0]
    y2=m[1]
    s = 0
    if (x1==x2):
        s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    else:
        s=((y2-y1)*modinv(x2-x1,p))%p
    x3=(s**2-x1-x2)%p
    y3=(s*(x1-x3)-y1)%p
    print str(i)+"p:\t", (x3,y3)

nPlusm(n,m)
# until x3 = x1 and y3 != y1





