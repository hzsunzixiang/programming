#!/usr/bin/env python
# -*- coding:UTF-8
def p_decorate(func):
   def func_wrapper(name):
       return "<p>{0}</p>".format(func(name))
   return func_wrapper

@p_decorate
def get_text(name):
   return "lorem ipsum, {0} dolor sit amet".format(name)

print(get_text("John"))

# Outputs <p>lorem ipsum, John dolor sit amet</p>

#def get_text(name):
#   return "lorem ipsum, {0} dolor sit amet".format(name)
#
#def p_decorate(func):
#   def func_wrapper(name):
#       return "<p>{0}</p>".format(func(name))
#   return func_wrapper
#
#my_get_text = p_decorate(get_text)
#
#print(my_get_text("John"))
