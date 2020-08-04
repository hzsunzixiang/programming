#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json

l = ['a', 'b', 'c', 'd', 'e','f']
print(l)

#打印列表
print(zip(l[:-1],l[1:]))
print(list(zip(l[:-1],l[1:])))
print(tuple(zip(l[:-1],l[1:])))
print(dict(zip(l[:-1],l[1:])))
