#!/usr/bin/env python
# -*- coding:UTF-8

# 这里有递归的思想 注意研究
def strong_decorate(func):
    print("in strong_decorate func:%s"% func)
    def func_wrapper_strong(name):
        print("in func_wrapper_strong func%s"%func)
        tmp = "<strong>{0}</strong>".format(func(name))
        print("tmp_strong:%s"%tmp)
        return  tmp
    print("return func_wrapper_strong")
    return func_wrapper_strong

def p_decorate(func):
   print("in p_decorate %s"%func)
   def func_wrapper_p(name):
       print("in func_wrapper_p, func:%s"%func)
       tmp ="<p>{0}</p>".format(func(name))
       print("tmp_p:%s"%tmp)
       return tmp
   print("return func_wrapper_p")
   return func_wrapper_p


def div_decorate(func):
    print("in div_decorate func%s"%func)
    def func_wrapper_div(name):
        print("in func_wrapper_div func:%s"% func)
        tmp = "<div>{0}</div>".format(func(name))
        print("tmp_div:%s"%tmp)
        return tmp
    print("return func_wrapper_div")
    return func_wrapper_div

def get_text(name):
   print("in get_text, name:%s"%name)
   tmp = "lorem ipsum, {0} dolor sit amet".format(name)
   print("tmp_text:%s"%tmp)
   return tmp


#get_text1 = strong_decorate(get_text)
#get_text2 = p_decorate(get_text1)
#get_text = div_decorate(get_text2)
#get_text = div_decorate(p_decorate(strong_decorate(get_text)))

#print(get_text("John"))
xxx = div_decorate(p_decorate(strong_decorate(get_text)))
print(xxx("John"))
#print (div_decorate(p_decorate(strong_decorate(get_text)))("John"))




