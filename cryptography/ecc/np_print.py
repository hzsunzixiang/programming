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
import itertools
intersect = []
for item in xlable.keys():
    if ylable.has_key(item):
        tmp = list(itertools.product(xlable[item], ylable[item]))
        intersect = intersect + tmp;
        #intersect =  [(x,y) for x in xlable[item] for y in ylable[item]]
print sorted(intersect)
print len(intersect)
    



def modInverse(a, m) :
    a = a % m;
    for x in range(1, m) :
        if ((a * x) % m == 1) :
            return x
    return 1

## Driver Program
#a = 2
#m = 17
#print(modInverse(a, m))


# calc

#[(0, 6), (0, 11), (3, 1), (3, 16), (5, 1), (5, 16), (6, 3), (6, 14), (7, 6), (7, 11), (9, 1), (9, 16), (10, 6), (10, 11), (13, 7), (13, 10), (16, 4), (16, 13)]
x1=5
y1=1
x2=5
y2=1
print str(1)+"p:\t", (x1,y2)
for i in range(2,20):
    s = 0
    if (x1==x2):
        s=((3*(x1**2)+a)*modInverse(2*y1,p))%p
    else:
        s=((y2-y1)*modInverse(x2-x1,p))%p
    x3=(s**2-x1-x2)%p
    y3=(s*(x1-x3)-y1)%p
    print str(i)+"p:\t", (x3,y3)
    (x2,y2)=(x3,y3)





