#!/usr/bin/env python3
# -*- coding:UTF-8

def pass_thru(func_to_decorate):
    print("in pass_thru")
    def new_func(*original_args, **original_kwargs):
        print("original_kwargs:", original_kwargs)
        print("Function has been decorated.  Congratulations.")
        return func_to_decorate(*original_args)
    print("return pass_thru")
    return new_func


# Notice nothing here now
def print_args(*args):
    for arg in args:
        print(arg)



pass_thru(print_args)
