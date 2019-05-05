#!/usr/bin/env python3
# -*- coding:UTF-8


def foo(x, y, z):
    print("First is ", x, " then ", y, " lastly ", z)

def bar(**args):
    print(args)
 

def fun(*args):
    print(args)

if __name__ == '__main__':
 
    d = {"y": 23, "z": 56, "x": 15}
     
    #foo(d)
    # TypeError: foo() takes exactly 3 arguments (1 given)
     
    foo(*d)
    # Works, but not what you wanted
    # First is z then x lastly y
     
    foo(**d)
    # First is 15 then 23 lastly 56

    bar(**d)
    fun(*d)

    #TypeError: fun() got an unexpected keyword argument 'y'
    #fun(**d)


    #TypeError: bar() takes 0 positional arguments but 3 were given
    #bar(*d)

