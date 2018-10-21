#!/usr/bin/env python
# -*- coding:UTF-8

# 没有实验出来
class Person(object):
    def __init__(self):
        self.name = "John"
        self.family = "Doe"

    def get_fullname(self):
        print("in get_fullname self:%s"%self)
        return self.name+" "+self.family

    def p_decorate(self, func):
       print("in p_decorate func:%s"% func)
       def func_wrapper(self):
           tmp = "<p>{0}</p>".format(func(self))
           print("tmp:%s"%tmp)
           return tmp
       print("return p_decorate:%s"% func_wrapper)
       return func_wrapper
# 未调用之前，就会运行 p_decorate
my_person = Person()
#fun = my_person.p_decorate(my_person.get_fullname)
#((my_person.p_decorate)(my_person.get_fullname))(my_person)
#((my_person.p_decorate)(my_person.get_fullname))
my_person.p_decorate(my_person.get_fullname)()





#print(my_person.get_fullname())
#fun(my_person)

