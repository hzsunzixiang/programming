#!/usr/bin/env python3
# -*- coding:UTF-8



import gevent

def run_forever():
    gevent.sleep(2)
    return "hello,world"

jobs = [gevent.spawn(run_forever)]

gevent.joinall(jobs, timeout=3)
#gevent.joinall(jobs, timeout=2)
#thread.join(1)   # 会超时返回
#thread.join()

result = [job.value for job in jobs]
print(result)

