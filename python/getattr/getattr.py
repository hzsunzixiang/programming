#!/usr/bin/env python
# -*- coding:UTF-8

#https://stackoverflow.com/questions/4075190/what-is-getattr-exactly-and-how-do-i-use-it
# https://docs.python.org/3/library/functions.html#getattr

class Person():
    name = 'Victor'
    def say(self, what):
        print(self.name, what)

getattr(Person, 'name')

attr_name = 'name'
person = Person()
getattr(person, attr_name)
getattr(person, 'say')('Hello')


obj = 1000
for attr_name in dir(obj):
    attr_value = getattr(obj, attr_name)
    #print(attr_name, attr_value, callable(attr_value))
    print(attr_name)

#>>> help(dir)
#Help on built-in function dir in module __builtin__:
#
#
#dir(...)
#    dir([object]) -> list of strings
#
#    If called without an argument, return the names in the current scope.
#    Else, return an alphabetized list of names comprising (some of) the attributes
#    of the given object, and of attributes reachable from it.
#    If the object supplies a method named __dir__, it will be used; otherwise
#    the default dir() logic is used and returns:
#      for a module object: the module's attributes.
#      for a class object:  its attributes, and recursively the attributes
#        of its bases.
#      for any other object: its attributes, its class's attributes, and
#        recursively the attributes of its class's base classes.


#>>> dir(Person)
#['__doc__', '__module__', 'name', 'say']

#>>> getattr(person, 'age', 10)
#10

#>>> dir(Person)
#['__doc__', '__module__', 'name', 'say']

#>>> setattr(person, 'age', 10)

#>>> dir(Person)
#['__doc__', '__module__', 'name', 'say']

#>>> dir(person)
#['__doc__', '__module__', 'age', 'name', 'say']

#>>> getattr(Person, 'age', 10)
#10

#>>> dir(Person)
#['__doc__', '__module__', 'name', 'say']
#>>> setattr(Person, 'age', 10)
#>>> dir(Person)
#['__doc__', '__module__', 'age', 'name', 'say']
#>>>

# https://docs.python.org/3/library/functions.html#getattr

#hasattr(object, name)¶
#The arguments are an object and a string. The result is True if the string is the name of one of the object’s attributes, False if not. (This is implemented by calling getattr(object, name) and seeing whether it raises an AttributeError or not.)
