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


# [(0, 1), (0, 22), (4, 10), (4, 13), (5, 7), (5, 16), (8, 10), (8, 13), (11, 10), (11, 13), (13, 11), (13, 12), (14, 2), (14, 21)]
