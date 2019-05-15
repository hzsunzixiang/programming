#!/usr/bin/env python3
# -*- coding:UTF-8



class B(object):
    def __getattribute__(self, name):
        print("you are useing getattribute")
        return object.__getattribute__(self, name)
b = B()
b.y
b.two
