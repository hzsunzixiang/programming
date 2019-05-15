#!/usr/bin/env python
# -*- coding:UTF-8

class A(object):
    author = "qiwsir"
    def __getattr__(self, name):
        if name != "author":
            return "from starter to master."
    def test(self, name):
        pass

if __name__ == "__main__":
    a = A()
    print a.author
    print a.lang
    print A.__dict__ 
    print a.__dict__ 



#ericksun@debian:~/programming/python/attr$ ./4_attr.py
#qiwsir
#from starter to master.
#{'__module__': '__main__', 'author': 'qiwsir', '__getattr__': <function __getattr__ at 0x7fe3e30176e0>, '__dict__': <attribute '__dict__' of 'A' objects>, '__weakref__': <attribute '__weakref__' of 'A' objects>, '__doc__': None}
#{}
#
