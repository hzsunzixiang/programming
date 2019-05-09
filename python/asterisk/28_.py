#!/usr/bin/env python3
# -*- coding:UTF-8

fruits = ['lemon', 'pear', 'watermelon', 'tomato']
print((*fruits[1:], fruits[0]))
#('pear', 'watermelon', 'tomato', 'lemon')
uppercase_fruits = (f.upper() for f in fruits)
print(uppercase_fruits)
#print(*uppercase_fruits) # 这里很奇怪 使用之后变量就重置为空了

print({*fruits, *uppercase_fruits})
#{'lemon', 'watermelon', 'TOMATO', 'LEMON', 'PEAR', 'WATERMELON', 'tomato', 'pear'}
print({*fruits, *fruits})

#set().union(fruits, uppercase_fruits)





