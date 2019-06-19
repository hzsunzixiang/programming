#!/usr/bin/env python3
# -*- coding:UTF-8

import gevent
import random

def task(pid):
    """
    Some non-deterministic task
    """
    print(f"in i: {pid}")
    gevent.sleep(random.randint(0,2)*0.1)
    print('Task', pid, 'done')
    return pid

def synchronous():
    for i in range(1,10):
        task(i)

def asynchronous():
    threads = [gevent.spawn(task, i) for i in range(10)]
    gevent.joinall(threads)
    result = [thread.value for  thread in threads]
    print(result)

print('Synchronous:')
synchronous()

print('Asynchronous:')
asynchronous()
