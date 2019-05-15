#!/usr/bin/env python3
# -*- coding:UTF-8

class A(object):
    def __getattr__(self, name):
        print("You use getattr")
    def __setattr__(self, name, value):
        print("You use setattr")
        self.__dict__[name] = value


print(A.__dict__)


a=A()
print(A.__dict__)
print(a.__dict__)
a.x
print(A.__dict__)
print(a.__dict__)
a.x = 7
print(A.__dict__)
print(a.__dict__)
print(a.x)
