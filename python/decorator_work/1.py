#!/usr/bin/env python3



def run_instance_prepaid(args):
    print("run_instance_prepaid")
    return 

def run_instance_postpaid_by_hour(args):
    print("run_instance_postpaid_by_hour")
    return

def run_instance_cdhpaid(args):
    print("run_instance_cdhpaid")
    return


fun_dict = {'PREPAID': run_instance_prepaid, 'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour, 'CDHPAID': run_instance_cdhpaid}
args={ 'InstanceChargeType': 'PREPAID'}
print(fun_dict['PREPAID'])

print(fun_dict[args['InstanceChargeType']])
fun_dict[args['InstanceChargeType']]("h")


{'PREPAID': run_instance_prepaid, 'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour, 'CDHPAID': run_instance_cdhpaid}[args['InstanceChargeType']]("h")

#args['InstanceChargeType']("h")

def fun(**args):
    return {
        'PREPAID': run_instance_prepaid,
        'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour,
        'CDHPAID': run_instance_cdhpaid
    }[args['InstanceChargeType']](args)


fun(**args)


