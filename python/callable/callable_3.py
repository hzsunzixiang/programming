#!/usr/bin/python
# -*- coding=UTF-8 -*-



class Employee:
    id = 0
    name = ""

    def __init__(self, i, n):
        self.id = i
        self.name = n

    def __call__(self, *args, **kwargs):
        print('printing args')
        print(*args)

        print('printing kwargs')
        for key, value in kwargs.items():
            print("%s == %s" % (key, value))



Employee(10, 'Pankaj')(10, 20, {'x': 1, 'y': 2}) 
Employee(10, 'Pankaj')(10, 'A', name='Pankaj', id=20)  # args and kwargs both

