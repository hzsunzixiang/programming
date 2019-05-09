#!/usr/bin/env python3
# -*- coding:UTF-8
fruits = ['lemon', 'pear', 'watermelon', 'tomato']
((first_letter, *remaining), *other_fruits) = fruits
print(remaining)
(first_letter, *remaining) = "lemon"
print(remaining)
#['e', 'm', 'o', 'n']
print(other_fruits)
#['pear', 'watermelon', 'tomato']
