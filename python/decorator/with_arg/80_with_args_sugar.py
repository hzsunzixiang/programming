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

@decorator("arg1", "arg2")
def print_args(*args):
    for arg in args:
        print(arg)



# 上面导致，在没有任何函数调用的情况下 会先运行 decorator 函数
# 相当于首先运行了
# decorator("arg1", "arg2")


# 参考 60_sugar.py

# 返回函数 real_decorator 之后 随后又自动运行了 real_decorator

#@real_decorator
#def print_args(*args):




#(Pdb) n
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(20)<module>()
#-> @decorator("arg1", "arg2")
#(Pdb) n
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(6)decorator()
#-> print("in decorator......")
#(Pdb) n
#in decorator......
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(8)decorator()
#-> def real_decorator(function):
#(Pdb) n
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(16)decorator()
#-> print("return in decorator......")
#(Pdb) n
#return in decorator......
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(18)decorator()
#-> return real_decorator
#(Pdb) n
#--Return--
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(18)decorator()-><functio...79045a28>
#-> return real_decorator
#(Pdb) n
#--Call--
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(8)real_decorator()
#-> def real_decorator(function):
#(Pdb) n
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(10)real_decorator()
#-> print("in real_decorator ......")
#(Pdb) n
#in real_decorator ......
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(11)real_decorator()
#-> def wrapper(*args, **kwargs):
#(Pdb) n
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(14)real_decorator()
#-> print("return in real_decorator ......")
#(Pdb) n
#return in real_decorator ......
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(15)real_decorator()
#-> return wrapper
#(Pdb) n
#--Return--
#> /home/ericksun/programming/python/decorator/with_arg/80_with_args_sugar.py(15)real_decorator()-><functio...79045f50>
#-> return wrapper



