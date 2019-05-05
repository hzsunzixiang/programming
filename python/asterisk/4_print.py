#!/usr/bin/env python3
# -*- coding:UTF-8



if __name__ == '__main__':
 
    a = { 23,  56, 15}
    d = {"y": 23, "z": 56, "x": 15}
    print(d)
    print(*d)
    #print(**d)  # error
    print(a)
    print(*a)
    print(*{"a": 13, "b": 96, "c": 10})
     
