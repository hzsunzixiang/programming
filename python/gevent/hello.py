#!/usr/bin/env python
# -*- coding:UTF-8

import gevent

def foo():
    print('Running in foo')
    gevent.sleep(2)
    print('Explicit context switch to foo again')

def bar():
    print('Explicit context to bar')
    gevent.sleep(10)
    print('Implicit context switch back to bar')

gevent.joinall([
    gevent.spawn(foo),
    gevent.spawn(bar),
    #gevent.spawn(bar),
    #gevent.spawn(bar),
    #gevent.spawn(bar),
    #gevent.spawn(bar),
    #gevent.spawn(bar),
])


