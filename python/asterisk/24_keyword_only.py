#!/usr/bin/env python3
# -*- coding:UTF-8


def get_multiple(*keys, dictionary, default=None):
    return [
        dictionary.get(key, default)
        for key in keys
    ]

fruits = {'lemon': 'yellow', 'orange': 'orange', 'tomato': 'red'}
print(get_multiple('lemon', 'tomato', 'squash', dictionary=fruits, default='unknown'))

#get_multiple('lemon', 'tomato', 'squash', fruits, 'unknown')

#The above function can be used like this:
#>>> fruits = {'lemon': 'yellow', 'orange': 'orange', 'tomato': 'red'}
#>>> get_multiple('lemon', 'tomato', 'squash', dictionary=fruits, default='unknown')
#['yellow', 'red', 'unknown']
#
#The arguments dictionary and default come after *keys, which means they can only be specified as keyword arguments. If we try to specify them positionally we’ll get an error:
#	
#>>> fruits = {'lemon': 'yellow', 'orange': 'orange', 'tomato': 'red'}
#>>> get_multiple('lemon', 'tomato', 'squash', fruits, 'unknown')
#Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
#TypeError: get_multiple() missing 1 required keyword-only argument: 'dictionary'

