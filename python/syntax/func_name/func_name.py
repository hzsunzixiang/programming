#!/usr/bin/env python
# coding=utf-8

"""
study __getattr__ and __setattr__
"""


def fun():
    print(dir(fun))
    pass

if __name__ == "__main__":
   fun()
   print(fun.func_name)
   fun.func_name="hello_fun"
   print(fun.func_name)



#ericksun@debian:~/programming/python/syntax/func_name$ ./simple_1.py
#['__call__', '__class__', '__closure__', '__code__', '__defaults__', '__delattr__', '__dict__', '__doc__', '__format__', '__get__', '__getattribute__', '__globals__', '__hash__', '__init__', '__module__', '__name__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'func_closure', 'func_code', 'func_defaults', 'func_dict', 'func_doc', 'func_globals', 'func_name']
#fun
#hello_fun
#
