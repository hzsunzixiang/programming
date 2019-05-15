

#print("second in test file")
#def entry():
#    print("in entry ##########################")
#
supported_actions = {}

def action(url='http://api.qcloud.com/v2', inquiryable=False, switchable=False, inquiryresourceable=False, **args):
    print("in staticmethod action")
    def _(func):
        assert func.__name__ == 'entry', "API 入口必须以 entry 作为函数名，而不能是 %s。" % func.__name__
        supported_actions[func.name] = func
        print('识别到 %s 入口点并挂载...' % func.__name__)
        return func

    print("in staticmethod action return")
    return _

class schema(object):
#
#    @staticmethod
    def request(**args):
        print("in staticmethod request")
        def _(func):
            print("in staticmethod request decorator, name:%s"% func.__name__)
            # 参数依然可以传过来
            print("in staticmethod request decorator, args:%s"% args)

            source_file_path_elem = func.raw_func.__code__.co_filename.split(
                '/')
            print("debug func:%s"%func)
            print("debug func.raw_func:%s"%func.raw_func)
            print("debug func.raw_func.__code__:%s"%func.raw_func.__code__)
            print("debug func.raw_func.__code__.co_filename:%s"%func.raw_func.__code__.co_filename)
            print("debug request args:%s"%args)
            print("debug source_file_path_elem:%s"%source_file_path_elem)
#debug func:<function schema.response.<locals>._.<locals>.wrap_func at 0x7f149cefcbf8>
#debug func.raw_func:<function entry at 0x7f149cefcb70>
#debug func.raw_func.__code__:<code object entry at 0x7f149cf52f60, file "./main5.py", line 109>
#debug func.raw_func.__code__.co_filename:./main5.py
#debug request args:{'Uin': 'ericksun'}
#debug source_file_path_elem:['.', 'main5.py']
            if 'name' not in args:
                name = source_file_path_elem[-1].split('.')[0]
            else:
                if '.' in args['name']:
                    args['name'] = args['name'].split('.')[-1]
                name = args['name']
            print("debug name:%s"%name)

            def wrap_func(**input_args):
                print("in staticmethod request wrap_func run.....")
                _args={ 'InstanceChargeType': 'PREPAID'}
                result = func(**(_args))
                print("in staticmethod request wrap_func return")
                return result

            print("in staticmethod request run raw_fun assign")
            wrap_func.__doc__ = func.__doc__
            wrap_func.__name__ = func.__name__
            wrap_func.raw_func = func.raw_func
            wrap_func.recv = args
            wrap_func.send = func.send
            wrap_func.name = name
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

            print("in staticmethod response run raw_fun assign")
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
