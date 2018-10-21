#!/usr/bin/env python3
# -*- coding:UTF-8


def bar(**kwargs):
    #print(*kwargs)
    print(kwargs)
    print(type(kwargs))
    for key, value in kwargs.items():
        print(key, value)

#>>> print_table(a = 5, b = 6, c = 7)
 
if __name__ == '__main__':
 
    d = {"y": 23, "z": 56, "x": 15}
    
    # 下面三个恒等
    bar(**d)
    bar(**{"y": 23, "z": 56, "x": 15})
    bar(y=23, z=56, x=15)

