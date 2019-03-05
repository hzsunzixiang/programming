#!/usr/bin/env python
# -*- coding:UTF-8


def lablex(x):
    return [(x**3+x+10)%23,x]

def labley(y):
    return [(y**2)%23,y]
#https://stackoverflow.com/questions/39322625/how-to-put-python-loop-output-in-a-list
lstx=[]
for num in range(0,22):
    lstx.append(lablex(num))
print (lstx)

print "\n\n\n"
lsty=[]
for num in range(0,22):
    lsty.append(labley(num))
print (lsty)
#print "---------------------------------------\n"	
#for num in range(1,23):
#    print labley(num)

    
