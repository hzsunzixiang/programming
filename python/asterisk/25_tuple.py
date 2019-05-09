#!/usr/bin/env python3
# -*- coding:UTF-8

fruits = ['lemon', 'pear', 'watermelon', 'tomato']
first, second, *remaining = fruits
print(remaining)
first, *remaining = fruits
print(remaining)
#['pear', 'watermelon', 'tomato']
first, *middle, last = fruits
print(middle)
#['pear', 'watermelon']
