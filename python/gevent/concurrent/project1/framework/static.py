# 进程的静态存储区：用来提供具有进程级生命周期的变量。
# 实现 context 功能依赖 static 所提供的能力。
# 使用static定义可变变量（例如list,map）时，注意清理数据，否则会造成内存泄漏。
import threading
import gevent.threading
import uuid
import cbor
import hashlib


_tid = gevent.threading.get_ident


def compute_key(function, args, kwargs):
    key = cbor.dumps((function.__name__, args, kwargs))
    return hashlib.sha1(key).hexdigest()


# 全局的 memorize 实现 TODO(skipzhang) 待合并
def memorize(function):
    def __memorize(*args, **kwargs):

        key = compute_key(function, args, kwargs)
        if key in global_cache:
            return global_cache[key]

        result = function(*args, **kwargs)
        global_cache[key] = result
        return result
    return __memorize


def clear_context():
    # NOTE(skipzhang) tid_requestid_map 应该还存在轻微内存泄漏，但可以忽略
    tid = _tid()
    request_id = tid_requestid_map[tid]
    del global_context[request_id]
    del tid_requestid_map[tid]


def delete_context(request_id):
    try:
        del static.global_context[request_id]
    except:
        pass


def switch_context(request_id):
    tid_requestid_map[_tid()] = request_id


def create_context_and_switch(request_id):
    global_context[request_id] = {}
    tid_requestid_map[_tid()] = request_id


def init_context(request_id=None):  # 初始化上下文
    import context
    tid = _tid()

    # 如果没有 requestId，那么指定一个requestId
    if tid not in tid_requestid_map:
        tid_requestid_map[tid] = request_id if request_id else str(uuid.uuid4())

    context.delay = {}  # 参数检查依赖
    context.args = {}  # 参数检查依赖
    context.cache = {}  # memorize 依赖


def get_current_request_id():
    try:
        return tid_requestid_map[_tid()]
    except:
        return 'MAIN'

# 上下全局变量，key为request_id,value为该request_id所能获取的context对象
global_context = {}
global_cache = {}  # 不会过期的进程级别cache，主要用于Pandora缓存
# 存储tid和requestid之间的关系。
tid_requestid_map = {}

