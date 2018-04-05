#!/usr/bin/env python
# -*- coding:UTF-8


# https://stackoverflow.com/questions/20585920/how-to-add-multiple-values-to-a-dictionary-key-in-python
xlable = dict()
ylable = dict()
def lablex(x):
    xlable.setdefault((x**3+x+10)%23,[]).append(x)

def labley(y):
    ylable.setdefault((y**2)%23,[]).append(y)
#https://stackoverflow.com/questions/39322625/how-to-put-python-loop-output-in-a-list
lstx=[]
for num in range(0,22):
    lablex(num)
#print (xlable)

print "\n\n\n"
for num in range(0,22):
    labley(num)

#print (ylable)

import itertools
intersect = []
for item in xlable.keys():
    if ylable.has_key(item):
        #print xlable[item], ylable[item]
        #c = list(itertools.product(xlable[item], ylable[item]))
        tmp = list(itertools.product(xlable[item], ylable[item]))
        intersect = intersect + tmp;
        #print c
        #intersect =  [(x,y) for x in xlable[item] for y in ylable[item]]
print intersect

#    intersect.append(item)
#print "---------------------------------------\n"	
#for num in range(1,23):
#    print labley(num)

    
