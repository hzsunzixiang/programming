#!/usr/bin/python
# -*- coding=UTF-8 -*-


DES_TASK_STATUS_MAP = {
    '2': 'WAITING',
    '5': 'RUNNING',
    '6': 'SUCCESS',
    '3': 'FAIL',
}

INNER_DES_TASK_STATUS_MAP = {
    value: key
    for key, value in DES_TASK_STATUS_MAP.items()
}


print(INNER_DES_TASK_STATUS_MAP)


def des_task_status_converter(values):
    return [int(INNER_DES_TASK_STATUS_MAP[value]) for value in values]


print(des_task_status_converter(["WAITING","RUNNING"]))



s = set([1,2,3])
t = set([1,2])
print(t.issubset(s))



TRANSLOG_TASK_STATUS_MAPPING = {
    '0': "RUNNING",
    '1': "SUCCESS",
    '2': "FAIL",
    '3': "ROLLBACK_FAIL",
    '4': "ALMOST_DONE"
}

INNER_TRANSLOG_TASK_STATUS_MAPPING = {
    value: key
    for key, value in TRANSLOG_TASK_STATUS_MAPPING.items()
}

print(INNER_TRANSLOG_TASK_STATUS_MAPPING)
print(list(INNER_TRANSLOG_TASK_STATUS_MAPPING.keys()))

all_enum  = set(INNER_TRANSLOG_TASK_STATUS_MAPPING.keys())

#sub_set = ['RUNNING', 'SUCCESS', 'FAIL']
sub_set = ['RUNNING', 'SUCCESS', 'FAILxx']

print(set(sub_set).issubset(all_enum))


print(f"The value '{sub_set}' specified in the parameter '{sub_set}' is not valid.")









