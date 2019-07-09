#!/usr/bin/env python
# -*- coding:UTF-8

'''
@author
'''


class MyClass:
    i = 3

class Complex(object):
    var=1000
    #def __init__(self, realpart, imagpart):
    def __init__(self):
        Complex.var=2000
        self.r = 2 
        self.i = 3 
        raise ValueError('A very specific bad thing happened.')

if __name__ == '__main__':
    try:
        x = Complex()
    except Exception, e:
        print('write translog except %s' % e)
    #x = Complex(3.0, -4.5)
    #x.r= 6
    #x.i=8
    #print x.r, x.i
    print Complex.var
