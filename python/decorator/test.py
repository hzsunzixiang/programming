#!/usr/bin/env python
# -*- coding:UTF-8

def outer_decorator(func):
    def inner_wrapper(name):
        #return "<p>{0}</p>".format(func(name))
        return "<p>{0},{1}</p>".format(func(name), func(name))
    return inner_wrapper

def func(name): 
    return "lorem ipsum, {0} dolor sit amet".format(name)
    


print (outer_decorator(func)("hello"))
