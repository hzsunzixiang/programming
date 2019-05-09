#!/usr/bin/env python3
# -*- coding:UTF-8
def decorator(arg1, arg2):
    print("in decorator......")

    def real_decorator(function):

        print("in real_decorator ......")
        def wrapper(*args, **kwargs):
            print("Congratulations.  You decorated a function that does something with %s and %s" % (arg1, arg2))
            function(*args, **kwargs)
        print("return in real_decorator ......")
        return wrapper

    print("return in decorator......")
    return real_decorator


# No more decorator here
def print_args(*args):
    for arg in args:
        print(arg)

#decorator("arg1", "arg2")

# getting crazy down here
decorator("arg1", "arg2")(print_args)(1, 2, 3)
