#!/usr/bin/env python3

from functools import wraps
class schema(object):

    @staticmethod
    def flow(dct=None):
        def _(func):

            func.flow_dct = dct if dct else {}
            return func

        return _

    #print(schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")(entry).__name__)
    @staticmethod
    def response(**args):
        print("in staticmethod response")
        def decorator(func):
            print("in inner function _ func.__name__: %s "%func.__name__)

            @wraps(func)
            def wrap_func(**input_args):
                print("in wrap_func ")
                result = func(**input_args)
                print("in wrap_func return")
                return result

            wrap_func.__doc__ = func.__doc__
            wrap_func.raw_func = func
            wrap_func.__name__ = func.__name__
            wrap_func.send = args
            wrap_func.flow_dct = {}
            return wrap_func
        print("in staticmethod response return")
        return decorator


# 定义入口函数中的最终调用
#---------------------------------------
def run_instance_prepaid(args):
    print("run_instance_prepaid")
    return  "hello,world!"

def run_instance_postpaid_by_hour(args):
    print("run_instance_postpaid_by_hour")
    return  "hello,world!"

def run_instance_cdhpaid(args):
    print("run_instance_cdhpaid")
    return  "hello,world!"

# 定义装饰函数
#---------------------------------------
#@schema.response(
#    InstanceIdSet=["test"],
#    Price=100,
#    RequestId="RequestId")
#
def entry(**args):
    print("in real entry")
    return {
        'PREPAID': run_instance_prepaid,
        'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour,
        'CDHPAID': run_instance_cdhpaid
    }[args['InstanceChargeType']](args)


#schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")
#print(schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId").__name__)

# 这里返回内部的 wrap_func 
#schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")(entry)

# 这里打印 内部 wrap_func  的名字
# print(schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")(entry).__name__)

#print(schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")(entry).__name__)
## 打印出来相关参数
#print(schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")(entry).send)

# 调用 wrap_func
xx=schema.response( InstanceIdSet=["test"], Price=100, RequestId="RequestId")(entry)
entry_args={ 'InstanceChargeType': 'PREPAID'}
#print(xx.__name__)
print(xx(**entry_args))








