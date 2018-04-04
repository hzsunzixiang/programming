#!/usr/bin/env python
# -*- coding:UTF-8





def addtive(x,y):
    return [x**3-7*x, y**2]

def lablex(x):
    return (x**3+x+10)%23

def labley(y):
    return (y**2)%23
#https://stackoverflow.com/questions/39322625/how-to-put-python-loop-output-in-a-list
lstx=[]
for num in range(1,23):
    lstx.append(lablex(num))
print sorted(set(lstx))

lsty=[]
for num in range(1,23):
    lsty.append(labley(num))
print sorted(set(lsty))
#print "---------------------------------------\n"	
#for num in range(1,23):
#    print labley(num)

    
