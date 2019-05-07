#!/usr/bin/env python3
# -*- coding:UTF-8

# 在2.x下运行不过
if __name__ == '__main__':
    fruits = ['lemon', 'pear', 'watermelon', 'tomato']
    numbers = [2, 1, 3, 4, 7]
    print(*numbers, *fruits)
