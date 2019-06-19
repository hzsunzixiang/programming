#!/usr/bin/env python3
# -*- coding:UTF-8



import gevent

def run_forever():
    gevent.sleep(3)
    return "hello,world"

thread = gevent.spawn(run_forever)

#thread.join(1)   # 会超时返回
thread.join()

print(thread.value)

