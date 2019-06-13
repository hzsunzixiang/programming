# coding:utf-8
# 多个协程并发请求。用于多个请求无依赖关系的场景，耗时依赖其中最长的耗时请求
import gevent
import threading
import gevent.threading
import uuid
#import cbor
import hashlib

from gevent.thread import get_ident

_tid = gevent.threading.get_ident


# 存储tid和requestid之间的关系。
tid_requestid_map = {}

def get_current_request_id():
    try:
        return tid_requestid_map[_tid()]
    except:
        return 'MAIN'



# 并发请求的超时时间，暂定为70秒，后续改为配置化
CONCURRENT_TIMEOUT = 70


def concurrent_execute(tasks):
    """
    该方法为每个task生成一个协程，同时并发请求，并返回处理结果
    :param tasks: 任务列表，每个任务是一个元组，包含方法和参数列表，如(function_name, a,b,c)
    :return: 任务结果列表
    """

    def greenlet_execute(requestId, func, *args):
        cur = gevent.getcurrent()
        cur._func = func
        _t = _tid()
        tid_requestid_map[_t] = requestId

        try:
            return func(*args)
        finally:
            del tid_requestid_map[_t]

    request_id = get_current_request_id()
    jobs = []
    for task in tasks:
        jobs.append(gevent.spawn(greenlet_execute, request_id, task[0], *(task[1:])))
    gevent.joinall(jobs, CONCURRENT_TIMEOUT)

    # check result
    for job in jobs:
        if not job.successful():
            print('Greenlet `%s` executed failed, please check!' % job._func)
            raise job.exception

    return [job.value for job in jobs]


if __name__ == '__main__':
    def test1():
        print('test1')
        gevent.sleep(11)
        return 'test1'

    def test2():
        print('test2 will raise exception')
        gevent.sleep(1)
        raise Exception('test2')

    def test3(a, b):
        print('test3 %d %d' % (a, b))
        gevent.sleep(3)
        return 'test3'

    tasks = [(test1,), (test2, ), (test3, 1, 2)]
    results = concurrent_execute(tasks)
    print('result:')
    for result in results:
        print(result)

