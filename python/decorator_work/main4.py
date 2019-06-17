#!/usr/bin/env python3

def action(url='http://api.qcloud.com/v2', inquiryable=False, switchable=False, inquiryresourceable=False, **args):
    print("in staticmethod action %s"%args)
    def _(func):
        assert func.__name__ == 'entry', "API 入口必须以 entry 作为函数名，而不能是 %s。" % func.__name__
        print('识别到 %s 入口点并挂载...' % func.__name__)
        return func

    print("in staticmethod action return")
    return _

class schema(object):
#
#    @staticmethod
    def request(**args):
        print("in staticmethod request:%s"%args)
        def _(func):
            print("in staticmethod request ##decorator##, name:%s"% func.__name__)
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
            print("in staticmethod request ##decorator##, name:%s return"% func.__name__)
            return wrap_func

        print("in staticmethod request return ")
        return _

    @staticmethod
    def flow(dct=None):
        print("in staticmethod flow :%s"%dct)
        def _(func):
            print("in staticmethod flow ##decorator##, name:%s"% func.__name__)
            func.flow_dct = dct if dct else {}
            print("in staticmethod flow ##decorator##, name:%s return"% func.__name__)
            return func

        print("in staticmethod flow return")
        return _

    @staticmethod
    def response(**args):
        print("in staticmethod response :%s"%(args)) 
        def _(func):
            print("in staticmethod response ###decorator### name: %s "%func.__name__)
            def wrap_func(**input_args):
                print("in staticmethod response wrap_func run .....")
                result = func(**input_args)
                print("in staticmethod response wrap_func return")
                return result

            wrap_func.__doc__ = func.__doc__
            wrap_func.raw_func = func
            wrap_func.__name__ = func.__name__
            wrap_func.send = args
            wrap_func.flow_dct = {}
            print("in staticmethod response ###decorator### name: %s return"%func.__name__)
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
@action(desc='用于创建一台或多台指定配置的实例', inquiryable=True, switchable=True)
@schema.request(
    Uin="ericksun"
)
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

print(entry(**args))

# 下面可以打印出函数的名字，已经被装饰过了
#print(entry.__name__)
# 所以此时可以打印出所传递的参数
# 这些参数就是 在函数加载时运行 schema.response 时的参数
#print(entry.send)
#print(entry(**args))

