#!/usr/bin/env python3
# -*- coding:UTF-8


def foo(x, y, z):
    print("First is ", x, " then ", y, " lastly ", z)
 
def bar(*args):
    print(args)

if __name__ == '__main__':

    a = [1, 50, 99]
    bar(*a)
     
    # foo(a)
    # TypeError: foo() takes exactly 3 arguments (1 given)
     
    #foo(*a)
    ## First is 1 then 50 lastly 99
    # 
    #b = [[55,66,77], 88, 99]
    #foo(*b)
    ## First is [55,66,77] then 88 lastly 99
    # 
    d = {"y": 23, "z": 56, "x": 15}
    # 
    foo(*d)
    ## This passes in the keys of the dict
    ## First is z then x lastly y
    foo(**d)

    b = (1, 50, 99)
    foo(*b)
    bar(*b)
