#!/usr/bin/env python3
# -*- coding:UTF-8
# 多个协程并发请求。用于多个请求无依赖关系的场景，耗时依赖其中最长的耗时请求
import gevent
import threading
import gevent.threading
import uuid
import cbor
import hashlib

from gevent.thread import get_ident

_tid = gevent.threading.get_ident


# 存储tid和requestid之间的关系。
tid_requestid_map = {}

def get_current_request_id():
    try:
        print("tid: ", _tid())
        return tid_requestid_map[_tid()]
    except:
        print("exception")
        return 'MAIN'


def init_context(request_id=None):  # 初始化上下文
    import context
    tid = _tid()

    # 如果没有如果没有 requestId，那么指定一个requestId
    if tid not in tid_requestid_map:
        tid_requestid_map[tid] = request_id if request_id else str(uuid.uuid4())

    context.delay = {}  # 参数检查依赖
    context.args = {}  # 参数检查依赖
    context.cache = {}  # memorize 依赖


# 并发请求的超时时间，暂定为70秒，后续改为配置化
CONCURRENT_TIMEOUT = 70


def concurrent_execute(tasks):
    """
    该方法为每个task生成一个协程，同时并发请求，并返回处理结果
    :param tasks: 任务列表，每个任务是一个元组，包含方法和参数列表，如(function_name, a,b,c)
    :return: 任务结果列表
    """

    def greenlet_execute(requestId, func, *args):
        #cur = gevent.getcurrent()
        #cur._func = func
        _t = _tid()
        tid_requestid_map[_t] = requestId
        print("inner request_id: ", request_id)

        try:
            return func(*args)
        finally:
            del tid_requestid_map[_t]

    request_id = get_current_request_id()
    print("request_id: ", request_id)
    jobs = []
    for task in tasks:
        print("para ",*(task[1:]))
        jobs.append(gevent.spawn(greenlet_execute, request_id, task[0], *(task[1:])))
    print("jobs ", jobs)
    gevent.joinall(jobs, CONCURRENT_TIMEOUT)

    # check result
    for job in jobs:
        if not job.successful():
            print('Greenlet `%s` executed failed, please check!' % job._func)
            raise job.exception

    return [job.value for job in jobs]


if __name__ == '__main__':
    print("tid: ", _tid())
    print("tid: ", gevent.threading.get_ident())
    def test1():
        print('test1')
        gevent.sleep(3)
        return 'test1'

    def test2():
        print('test2')
        gevent.sleep(1)
        #raise Exception('test2')
        return 'test2'


    def test3(a, b):
        print('test3 %d %d' % (a, b))
        gevent.sleep(3)
        return 'test3'

    tasks = [(test1,), (test2, ), (test3, 1, 2)]
    results = concurrent_execute(tasks)
    print('result:')
    for result in results:
        print(result)

