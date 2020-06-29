#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json


stats = {'a':1000, 'b':3000, 'c': 100}
#if you wanna find the max value with its key, maybe follwing could be simple, without any relevant functions.

print(max(stats, key=stats.get))
print(min(stats, key=stats.get))


#https://stackoverflow.com/questions/268272/getting-key-with-maximum-value-in-dictionary

