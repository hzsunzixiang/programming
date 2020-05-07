#!/usr/bin/env python3
# -*- coding:UTF-8
from __future__ import print_function
import sys
import inspect

def what_is_my_name():
    print(inspect.stack()[0][0].f_code.co_name)
    print(inspect.stack()[0][3])
    print(inspect.currentframe().f_code.co_name)
    print(sys._getframe().f_code.co_name)


what_is_my_name()
