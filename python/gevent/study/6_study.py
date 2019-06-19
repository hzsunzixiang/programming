#!/usr/bin/env python3
# -*- coding:UTF-8

import gevent
from gevent import Timeout
 
timeout = Timeout(2)  # 2 seconds
timeout.start()
 
#def wait():
#    gevent.sleep(10)
# 
#try:
#    gevent.spawn(wait).join()
#except Timeout:
#    print('Could not complete')
#
#with Timeout(1):
#    gevent.sleep(10)
class TooLong(Exception):
    print('Could not complete')
    pass
 
with Timeout(1, TooLong):
    gevent.sleep(10)
