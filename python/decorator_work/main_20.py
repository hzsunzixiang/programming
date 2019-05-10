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
#@schema.flow({
#    '.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit'],
#})
def entry(**args):
    return {
        'PREPAID': run_instance_prepaid,
        'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour,
        'CDHPAID': run_instance_cdhpaid
    }[args['InstanceChargeType']](args)


#print(entry(**args))
#schema.flow({'.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit']})(entry)
#print(schema.flow({'.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit']})(entry).__name__)
schema.flow({'.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit']})(entry)(**args)
print(schema.flow({'.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit']})(entry)(**args))








