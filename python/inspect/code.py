#!/usr/bin/env python3
# -*- coding:UTF-8
a = 1

def f(b):
    c = a + b

print(f.__code__.co_code)  
print(f.__code__.co_filename)  
print(f.__code__.co_varnames)  # prints ('b', 'c')
print(f.__code__.co_varnames)  # prints ('b', 'c')
print(f.__code__.co_names)     # prints ('a',)




#>>> help(f.__code__)
#
#>>> help(f.__name__)
#No Python documentation found for 'f'.
#Use help() to get the interactive help utility.
#Use help(str) for help on the str class.
#
#>>> help(f.__defaults__)

