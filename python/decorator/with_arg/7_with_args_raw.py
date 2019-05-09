#!/usr/bin/env python3
# -*- coding:UTF-8
def decorator(arg1, arg2):
    print("in decorator......")

    def real_decorator(function):

        def wrapper(*args, **kwargs):
            print("Congratulations.  You decorated a function that does something with %s and %s" % (arg1, arg2))
            function(*args, **kwargs)
        return wrapper

    return real_decorator


# No more decorator here
def print_args(*args):
    for arg in args:
        print(arg)

decorator("arg1", "arg2")

# getting crazy down here
#decorator("arg1", "arg2")
#decorator("arg1", "arg2")(print_args)(1, 2, 3)
