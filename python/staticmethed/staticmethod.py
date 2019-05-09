#!/usr/bin/env python
# -*- coding:UTF-8

#https://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod

class A(object):
    def foo(self, x):
        print "executing foo(%s, %s)" % (self, x)

    @classmethod
    def class_foo(cls, x):
        print "executing class_foo(%s, %s)" % (cls, x)

    @staticmethod
    def static_foo(x):
        print "executing static_foo(%s)" % x    

a = A()

a.foo(1)
a.class_foo(1)
A.class_foo(1)
a.static_foo(1)
A.static_foo('hi')
print(a.foo)
print(a.class_foo)
print(a.static_foo)
print(A.static_foo)
