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
     
    #bar(d)
    #bar(*d)
    bar(**d)

    bar(**{"a": 13, "b": 96, "c": 10})
    fun(*{"a": 13, "b": 96, "c": 10})
    fun(*d)
