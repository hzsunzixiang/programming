#!/usr/bin/env python
# -*- coding:UTF-8

def get_text(name):
   return "lorem ipsum, {0} dolor sit amet".format(name)

def p_decorate(func):
   print("in p_decorate")
   def func_wrapper(name):
       print("in func_wrapper")
       return "<p>{0}</p>".format(func(name))
   print("return func_wrapper")
   return func_wrapper

my_get_text = p_decorate(get_text)

print("begin call ")
print(my_get_text("John"))

#p_decorate(get_text)("erick")
#
#print(p_decorate(get_text)("erick"))
# <p>Outputs lorem ipsum, John dolor sit amet</p>
