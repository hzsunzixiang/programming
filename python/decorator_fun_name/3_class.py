#!/usr/bin/env python3

# 重在这里  这里修改了函数的名字
#def action(**args):
def action(url='http://api.qcloud.com/v2', inquiryable=False, switchable=False, inquiryresourceable=False, **args):
    print("in staticmethod action")
    def _(func):
        #assert func.__name__ == 'entry', "API 入口必须以 entry 作为函数名，而不能是 %s。" % func.__name__
        print('识别到 %s 入口点并挂载...' % func.__name__)
        return func

    print("in staticmethod action return")
    return _

def response1(**args):
    print("in staticmethod response")
    def _(func):
        print("in staticmethod response decorator name: %s "%func.__name__)
        def wrap_func(**input_args):
            print("in staticmethod response wrap_func run .....")
            result = func(**input_args)
            print("in staticmethod wrap_func return")
            return result

        # 重在这里  这里修改了函数的名字
        wrap_func.__doc__ = func.__doc__
        wrap_func.raw_func = func
        wrap_func.__name__ = func.__name__
        wrap_func.send = args
        wrap_func.flow_dct = {}
        return wrap_func
    print("in staticmethod response return")
    return _

# 这里有递归的思想 注意研究
def strong_decorate_outer(*args):
    def strong_decorate(func):
        print("in strong_decorate func:%s, name:%s"% (func, func.__name__))
        def func_wrapper_strong(name):
            print("in func_wrapper_strong func%s"%func)
            tmp = "<strong>{0}</strong>".format(func(name))
            print("tmp_strong:%s"%tmp)
            return  tmp
        func_wrapper_strong.__doc__ = func.__doc__
        func_wrapper_strong.raw_func = func
        func_wrapper_strong.__name__ = func.__name__
        func_wrapper_strong.send = args
        func_wrapper_strong.flow_dct = {}
        print("return func_wrapper_strong")
        return func_wrapper_strong
    return strong_decorate

class schema(object):
#
#    @staticmethod
    def request(**args):
        print("in staticmethod request")
        def _(func):
            print("in staticmethod request decorator, name:%s"% func.__name__)
            def wrap_func(**input_args):
                print("in staticmethod request wrap_func run.....")
                _args={ 'InstanceChargeType': 'PREPAID'}
                result = func(**(_args))
                print("in staticmethod request wrap_func return")
                return result

            wrap_func.__doc__ = func.__doc__
            wrap_func.__name__ = func.__name__
            wrap_func.raw_func = func.raw_func
            wrap_func.recv = args
            wrap_func.send = func.send
            print("in staticmethod request decorator return")
            return wrap_func

        print("in staticmethod request return ")
        return _

    @staticmethod
    def flow(dct=None):
        print("in staticmethod flow")
        def _(func):
            print("in staticmethod flow decorator, name:%s"% func.__name__)
            func.flow_dct = dct if dct else {}
            print("in staticmethod flow decorator return ")
            return func

        print("in staticmethod flow return")
        return _

    @staticmethod
    def response(**args):
        print("in staticmethod response")
        def _(func):
            print("in staticmethod response decorator name: %s "%func.__name__)
            def wrap_func(**input_args):
                print("in staticmethod response wrap_func run .....")
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
#@strong_decorate_outer("hello")
#@strong_decorate_outer("hello")
@action(desc='用于创建一台或多台指定配置的实例', inquiryable=True, switchable=True)
@strong_decorate_outer("hello")
#@schema.request(
#    Uin="ericksun"
#)
#@schema.flow({
#    '.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit'],
#})
@schema.response(
    InstanceIdSet=["test"],
    Price=100,
    RequestId="RequestId")
#@response1(
#    InstanceIdSet=["test"],
#    Price=100,
#    RequestId="RequestId")

def entry(**args):
    return {
        'PREPAID': run_instance_prepaid,
        'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour,
        'CDHPAID': run_instance_cdhpaid
    }[args['InstanceChargeType']](args)

#print(entry(**args))

# 下面可以打印出函数的名字，已经被装饰过了
#print(entry.__name__)
# 所以此时可以打印出所传递的参数
# 这些参数就是 在函数加载时运行 schema.response 时的参数
#print(entry.send)
#print(entry(**args))

