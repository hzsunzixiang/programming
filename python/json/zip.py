#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json

x = ['10.22.1.5', '10.22.1.7', '10.22.1.9']
y = [[None], [0], [0]]
print(x)
print(y)

list3 = [a[0] for a in y]
print(list3)
#dictionary = dict(zip(x, y))
dictionary = dict(zip(x, list3))
print(dictionary)

listx = [a for a in list3 if a is not None]
print(listx)


dictionary = dict(zip(x, list3))

checkvalue = None in dictionary.values()
print(checkvalue)

if None in dictionary.values():
    print("there is None")
#https://stackoverflow.com/questions/209840/convert-two-lists-into-a-dictionary
#https://stackoverflow.com/questions/12624623/combine-two-lists-into-one-multidimensional-list 

