#!/usr/bin/env python
# -*- coding:UTF-8

def pass_thru(func_to_decorate):
    def new_func(*original_args, **original_kwargs):
        print "Function has been decorated.  Congratulations."
        # Do whatever else you want here
        return func_to_decorate(*original_args, **original_kwargs)
    return new_func


@pass_thru
def print_args(*args):
    for arg in args:
        print arg

@pass_thru
def print_args1(*args, **kargs):
    for arg in args:
        print arg
    print(kargs)

print_args(1, 2, 3)
print_args1(1, 2, 3, a='y')
