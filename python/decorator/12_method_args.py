#!/usr/bin/env python
# -*- coding:UTF-8


#在所有代码运行之前首先初始化 p_decorate 函数
def p_decorate(func):
   print("in p_decorate func:%s"%func)
   def func_wrapper(*args, **kwargs):
       tmp = "<p>{0}</p>".format(func(*args, **kwargs))
       print("tmp:%s"%tmp)
       return tmp
   print("return p_decorate:%s"% func_wrapper)
   return func_wrapper

class Person(object):
    def __init__(self):
        self.name = "John"
        self.family = "Doe"

    @p_decorate
    def get_fullname(self):
        print("in get_fullname self:%s"%self)
        return self.name+" "+self.family

my_person = Person()
#
print(my_person.get_fullname())



