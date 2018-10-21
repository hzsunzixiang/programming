#!/usr/bin/env python
# -*- coding:UTF-8

def tags(tag_name):
    print("in tags")
    def tags_decorator(func):
        def func_wrapper(name):
            tmp = "<{0}>{1}</{0}>".format(tag_name, func(name))
            print("tmp in func_wrapper :%s"%func_wrapper)
            return tmp
        print("return func_wrapper")
        return func_wrapper
    print("return tags_decorator")
    return tags_decorator

# 在装饰起作用之前首先调用 tags("p") 函数  返回一个 装饰函数 tags_decorator
# 然后 tags_decorator 再去装饰 get_text 从而运行tags_decorator 返回 func_wrapper
@tags("p")
def get_text(name):
    return "Hello "+name

# 这里已经得到函数 func_wrapper
print(get_text("John"))

# Outputs <p>Hello John</p>
