#!/usr/bin/env python3
# -*- coding:UTF-8

def pass_thru(func_to_decorate):
    print("in pass_thru")
    def new_func(*original_args, **original_kwargs):
        print("original_kwargs:", original_kwargs)
        print("Function has been decorated.  Congratulations.")
        # Do whatever else you want here
        return func_to_decorate(*original_args, **original_kwargs)
    print("return pass_thru")
    return new_func


# Notice nothing here now
@pass_thru
def print_args(*args):
    for arg in args:
        print(arg)

# 在没有任何函数调用之前，就会首先运行 pass_thru
# 相当于运行了
#pass_thru(print_args)

# 如果再次运行这个函数 就会再次跑一边这个函数
#pass_thru(print_args)

# 这就是和原生不一样的地方

#print_args(1, 2, 3)
#print_args1(1, 2, 3, a="y")

