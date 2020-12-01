#!/usr/bin/env python
# -*- coding:UTF-8


# https://www.kite.com/python/docs/inspect.getargspec
import inspect
def f(a, b=2, *args, **kwargs):
    return a

#	ArgSpec(args=['a', 'b'], varargs='args', keywords='kwargs', defaults=(2,))
#	['a', 'b']
#	2

print(inspect.getargspec(f))
print(type(inspect.getargspec(f)))
print(len(inspect.getargspec(f)))
print(inspect.getargspec(f).args)
print(len(inspect.getargspec(f).args))


arg_tmp = inspect.getargspec(f)
print(arg_tmp)

#FullArgSpec(args=['a', 'b'], varargs='args', varkw='kwargs', defaults=(2,), kwonlyargs=[], kwonlydefaults=None, annotations={})
# python3 支持
print(inspect.getfullargspec(f))

# python3 支持
#https://docs.python.org/3/library/inspect.html#inspect.signature
print(inspect.signature(f))
