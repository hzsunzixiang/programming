#!/usr/bin/env python3
# -*- coding:UTF-8

def pass_thru(func_to_decorate):
    print("in pass_thru")
    # 错误给这个函数传了dict，但是此函数没有
    #def new_func(*original_args): # error
    def new_func(*original_args, **original_kwargs):
        print("Function has been decorated.  Congratulations.")
        # Do whatever else you want here
        # 这里并没有错，相当于参数只传了 original_args
        #return func_to_decorate(*original_args)
        return func_to_decorate(*original_args, **original_kwargs)
    return new_func


# Notice nothing here now
def print_args(*args, **kargs):
    for arg in args:
        print(arg)
    print(kargs)

# Notice the change here
#pass_thru(print_args)(1, 2, 3, a="y")
#pass_thru(print_args)(4, 5, 6)

dec_fun = pass_thru(print_args)
dec_fun(1, 2, 3, a="y")
