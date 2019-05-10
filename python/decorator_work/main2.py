#!/usr/bin/env python3

class schema(object):
    @staticmethod
    def flow(dct=None):
        print("in staticmethod flow")
        def _(func):
            print("in staticmethod flow decorator")
            func.flow_dct = dct if dct else {}
            print("in staticmethod flow decorator return ")
            return func

        print("in staticmethod flow return")
        return _

    @staticmethod
    def response(**args):
        print("in staticmethod response")
        def _(func):
            print("in inner function _ func.__name__: %s "%func.__name__)

            def wrap_func(**input_args):
                print("in staticmethod wrap_func")
                result = func(**input_args)
                print("in staticmethod wrap_func return")
                return result

            wrap_func.__doc__ = func.__doc__
            wrap_func.raw_func = func
            wrap_func.__name__ = func.__name__
            wrap_func.send = args
            wrap_func.flow_dct = {}
            return wrap_func
        print("in staticmethod response return")
        return _


# 定义入口函数中的最终调用
#---------------------------------------
args={ 'InstanceChargeType': 'PREPAID'}
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
@schema.flow({
    '.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit'],
})
@schema.response(
    InstanceIdSet=["test"],
    Price=100,
    RequestId="RequestId")

def entry(**args):
    return {
        'PREPAID': run_instance_prepaid,
        'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour,
        'CDHPAID': run_instance_cdhpaid
    }[args['InstanceChargeType']](args)


# 下面可以打印出函数的名字，已经被装饰过了
#print(entry.__name__)
# 所以此时可以打印出所传递的参数
# 这些参数就是 在函数加载时运行 schema.response 时的参数
#print(entry.send)
print(entry(**args))

#print(entry.send)

