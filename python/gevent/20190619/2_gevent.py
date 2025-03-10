#!/usr/bin/env python3
# -*- coding:UTF-8

#from gevent import monkey; monkey.patch_socket()
import gevent

def f(n):
    for i in range(n):
        print(gevent.getcurrent(), i)
        gevent.sleep(0)

g1 = gevent.spawn(f, 5)
g2 = gevent.spawn(f, 5)
g3 = gevent.spawn(f, 5)
g1.join()
g2.join()
g3.join()
