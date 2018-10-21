#!/usr/bin/env python3
# -*- coding:UTF-8


def fun(*args):
    print(*args)
    # error TypeError: type() argument 1 must be str, not int
    #print(type(*args))
    print(args)
    print(type(args))

if __name__ == '__main__':
 
    d = {23, 56, 15}
     
    # 下面三个等价
    fun(*d)
    fun(*{23, 56, 15})
    fun(23, 56, 15)

    #error
    #args=*{23, 56, 15}
