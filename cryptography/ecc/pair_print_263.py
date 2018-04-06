#!/usr/bin/env python
# -*- coding:UTF-8


#这篇文章中的一个实例 https://www.johannes-bauer.com/compsci/ecc/
p=263
a=2
b=3

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
# 可以看出 总共有31对(x,y)满足条件，加上0元素，一共是32个元素，构成一个阶为32的有限循环群
import itertools
intersect = []
for item in xlable.keys():
    if ylable.has_key(item):
        tmp = list(itertools.product(xlable[item], ylable[item]))
        intersect = intersect + tmp;
        #intersect =  [(x,y) for x in xlable[item] for y in ylable[item]]
print sorted(intersect)
print len(intersect)
    
