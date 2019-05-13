#!/usr/bin/env python
# -*- coding:UTF-8

# 这里有递归的思想 注意研究
def strong_decorate(func):
    print("in strong_decorate func:%s, name:%s"% (func, func.__name__))
    def func_wrapper_strong(name):
        print("in func_wrapper_strong func%s"%func)
        tmp = "<strong>{0}</strong>".format(func(name))
        print("tmp_strong:%s"%tmp)
        return  tmp
    print("return func_wrapper_strong")
    return func_wrapper_strong

def p_decorate(func):
   print("in p_decorate %s, name:%s"%(func, func.__name__))
   def func_wrapper_p(name):
       print("in func_wrapper_p, func:%s"%func)
       tmp ="<p>{0}</p>".format(func(name))
       print("tmp_p:%s"%tmp)
       return tmp
   print("return func_wrapper_p")
   return func_wrapper_p


def div_decorate(func):
    print("in div_decorate func%s, name:%s"%(func,func.__name__))
    def func_wrapper_div(name):
        print("in func_wrapper_div func:%s"% func)
        tmp = "<div>{0}</div>".format(func(name))
        print("tmp_div:%s"%tmp)
        return tmp
    print("return func_wrapper_div")
    return func_wrapper_div



@div_decorate
@p_decorate
@strong_decorate
def get_text(name):
   return "lorem ipsum, {0} dolor sit amet".format(name)

print(get_text("John"))

# Outputs <div><p><strong>lorem ipsum, John dolor sit amet</strong></p></div>
