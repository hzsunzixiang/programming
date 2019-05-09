#!/usr/bin/env python3
# -*- coding:UTF-8

def pass_thru(func_to_decorate):
    print("in pass_thru")
    # 错误给这个函数传了dict，但是此函数没有
    #def new_func(*original_args): # error
    def new_func(*original_args, **original_kwargs):
        print("original_kwargs:", original_kwargs)
        print("Function has been decorated.  Congratulations.")
        # Do whatever else you want here
        # 这里 错误 ， 传了多余的参数给 print_args 但其并不接受
        #return func_to_decorate(*original_args, **original_kwargs)
        return func_to_decorate(*original_args)
    return new_func


# Notice nothing here now
def print_args(*args):
    for arg in args:
        print(arg)

# Notice the change here
#pass_thru(print_args)(1, 2, 3, a="y")
#pass_thru(print_args)(4, 5, 6)

dec_fun = pass_thru(print_args)
dec_fun(1, 2, 3, a="y")


# 上面调用的参数其实传给 内部函数 new_func
# 然后 new_func 再分配参数 调用 print_args
