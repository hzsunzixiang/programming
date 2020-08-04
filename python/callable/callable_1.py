#!/usr/bin/python
# -*- coding=UTF-8 -*-

class Person:
    i = 0

    def __init__(self, id):
        self.i = id


p = Person(10)
print('Person Class is callable = ', callable(Person))
print('Person object is callable = ', callable(p))


#https://www.journaldev.com/22761/python-callable-__call__
