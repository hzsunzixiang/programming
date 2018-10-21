#!/usr/bin/env python
# -*- coding:UTF-8

#def p_decorate(func):
#   def func_wrapper(name):
#       return "<p>{0}</p>".format(func(name))
#   return func_wrapper
#
#def strong_decorate(func):
#    def func_wrapper(name):
#        return "<strong>{0}</strong>".format(func(name))
#    return func_wrapper
#
#def div_decorate(func):
#    def func_wrapper(name):
#        return "<div>{0}</div>".format(func(name))
#    return func_wrapper
def strong_decorate(func):
    print("in strong_decorate func:%s"% func)
    def func_wrapper_strong(name):
        print("in func_wrapper_strong func%s"%func)
        return "<strong>{0}</strong>".format(func(name))
    print("return func_wrapper_strong")
    return func_wrapper_strong

def p_decorate(func):
   print("in p_decorate %s"%func)
   def func_wrapper_p(name):
       print("in func_wrapper_p, func:%s"%func)
       return "<p>{0}</p>".format(func(name))
   print("return func_wrapper_p")
   return func_wrapper_p


def div_decorate(func):
    print("in div_decorate func%s"%func)
    def func_wrapper_div(name):
        print("in func_wrapper_div func:%s"% func)
        return "<div>{0}</div>".format(func(name))
    print("return func_wrapper_div")
    return func_wrapper_div


@div_decorate
@p_decorate
@strong_decorate
def get_text(name):
   return "lorem ipsum, {0} dolor sit amet".format(name)

print(get_text("John"))

# Outputs <div><p><strong>lorem ipsum, John dolor sit amet</strong></p></div>
