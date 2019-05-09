#!/usr/bin/env python3
# -*- coding:UTF-8


def decorator(arg1, arg2):
    print("in decorator......")

    def real_decorator(function):

        print("in real_decorator ......")
        def wrapper(*args, **kwargs):
            print("Congratulations.  You decorated a function that does something with %s and %s" % (arg1, arg2))
            function(*args, **kwargs)
        return wrapper

    return real_decorator

@decorator("arg1", "arg2")
def print_args(*args):
    for arg in args:
        print(arg)



# 上面导致，在没有任何函数调用的情况下 会先运行 decorator 函数
# 相当于首先运行了
# decorator("arg1", "arg2")

# 传参之后 
#decorator("arg1", "arg2")(print_args)(1, 2, 3)

# 调试可知 
#ericksun@debian:~/programming/python/decorator/with_arg$ python3 -m pdb 8_with_args_sugar.py
#> /home/ericksun/programming/python/decorator/with_arg/8_with_args_sugar.py(5)<module>()
#-> def decorator(arg1, arg2):
#(Pdb) break 6
#Breakpoint 1 at /home/ericksun/programming/python/decorator/with_arg/8_with_args_sugar.py:6
#(Pdb) c
#> /home/ericksun/programming/python/decorator/with_arg/8_with_args_sugar.py(6)decorator()
#-> print("in decorator......")
#(Pdb) n
#in decorator......
#> /home/ericksun/programming/python/decorator/with_arg/8_with_args_sugar.py(8)decorator()
#-> def real_decorator(function):
#(Pdb) n
#> /home/ericksun/programming/python/decorator/with_arg/8_with_args_sugar.py(15)decorator()
#-> return real_decorator

