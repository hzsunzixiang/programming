#!/usr/bin/env python
# -*- coding:UTF-8
"""
我们假设一个任务要执行12个流程：

其中要执行的流程为

{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'l', 'k'}


l 依赖于 ('a', 'c', 'k')  先执行才能运行
f 依赖于 ('a', 'j', 'l')  先执行才能运行
e 依赖于 ('k') 先执行才能运行
j 依赖于 ('e')  先执行才能运行

那么最佳解决方案为
{
    第一次，并发执行 {'k', 'i', 'b', 'c', 'g', 'a', 'd', 'h'},
    第二次，并发执行 {'e', 'l'},
    第三次，执行 {'j'},
    第四次，执行 {'f'}
}
run ['a', 'b', 'c', 'd', 'k', 'g', 'h', 'i']
join {'k', 'c', 'a'}
run ['e', 'l']
join {'e'}
run ['j']
join {'j', 'a', 'l'}
run ['f']
也就是理论上4步就可以完成。
如果是顺序执行，则需要12步。

本系统就是实现了这样的依赖分析器也成编排器。

主要用于流程（例如VStation）及参数（例如API参数检查）通用编排

* 支持缓存编排结果（或提前编译）。

"""
import functools


def is_all_requirement_ok(each, req, resolved_requirements):
    """
    判断单个流程是否满足全部依赖
    """
    if each in req:
        if all([i in resolved_requirements for i in req[each]]):
            return True
        else:
            return False
    else:
        return True


def get_resolved_requirement(result, level):
    """
    获取已经解决了全部依赖的流程
    """
    a = []
    if level == 0:
        return set(a)
    else:
        for i in range(0, level):
            a.extend(list(result[i]))
    return set(a)


def compose(all_set, req, level=0, result=None, plan=None):
    """

    编排有依赖关系的流程为一个执行流程，执行流程支持并发执行。
    >>> test_compose()
    True
    """
    if result is None or plan is None:
        result = {}
        plan = {}
    resolved_requirements = get_resolved_requirement(result, level)
    for each in all_set:
        if each not in resolved_requirements:
            if each in req and not is_all_requirement_ok(
                    each, req, resolved_requirements):
                try:
                    plan[level + 1].add(each)
                except KeyError:
                    plan[level + 1] = {each}
            else:
                try:
                    result[level].add(each)
                except KeyError:
                    result[level] = {each}

    if level + 1 in plan:
        compose(all_set, req, level + 1, result, plan)
    return result


def compose_join_table(all_set, req):
    f = compose(all_set, req)
    for step in f:
        a = [req[_] for _ in f[step] if req.get(_)]
        a = [y for x in a for y in x]
        f[step] = a
    return f


def test_compose():
    a = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'l', 'k')
    req = {'l': ('a', 'c', 'k'), 'f': ('a', 'j', 'l'), 'e': ('k'), 'j': ('e')}
    return compose(a, req) == {
        0: {'b', 'c', 'a', 'h', 'k', 'g', 'i', 'd'},
        1: {'e', 'l'},
        2: {'j'},
        3: {'f'}
    } and compose_join_table(a, req) == {
        0: [],
        1: ['a', 'c', 'k', 'k'],
        2: ['e'],
        3: ['a', 'j', 'l']
    }
a ={'.DataDisks', '.DesAction', '.DisasterRecoverGroupIds', '.InternetAccessible', '.DryRun', '.InstanceChargePrepaid', '.InstanceType', '.SystemDisk.DiskSize', '.InternetAccessible.InternetMaxBandwidthOut', '.VirtualPrivateCloud', '.LoginSettings.KeyIds.0', '.InstanceName', '.Placement.Zone', '.Uin', '.HostName', '.SystemDisk', '.SecurityGroupIds.0', '.ZoneId', '.LoginSettings.Password', '.InstanceChargePrepaid.TimeUnit', '.DataDisks.0.DiskSize', '.Placement.ProjectId', '.AvailableZone', '.Placement', '.ClientToken', '.AppId', '.ActionTimer', '.ImageId', '.EnhancedService.BasicService.Enabled', '.EnhancedService.MonitorService.Enabled', '.SystemDisk.DiskType', '.InstanceCount', '.UserData', '.LoginSettings.KeepImageLogin', '.EnhancedService.SecurityService.Enabled', '.DataDisks.0.DiskType', '.InstanceChargePrepaid.Period', '.LoginSettings.EncryptedWord', '.InstanceChargeType', '.InternetAccessible.PublicIpAssigned'}
req = {'.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit'], '.InstanceChargeType': ['.Uin', '.Placement', '.InstanceChargePrepaid'], '.SystemDisk.DiskSize': ['.ImageId', '.InstanceType', '.SystemDisk.DiskType'], '.DataDisks.0.DiskType': ['.SystemDisk'], '.DataDisks.0.DiskSize': ['.DataDisks.0.DiskType', '.InternetAccessible'], '.InternetAccessible': ['.InstanceType', '.InstanceChargeType'], '.InternetAccessible.PublicIpAssigned': ['.InternetAccessible.InternetMaxBandwidthOut', '.InstanceType'], '.InstanceCount': ['.InstanceChargeType', '.ClientToken', '.InstanceType'], '.LoginSettings.Password': ['.ImageId'], '.LoginSettings.EncryptedWord': ['.LoginSettings.Password'], '.LoginSettings.KeyIds.0': ['.ImageId'], '.LoginSettings.KeepImageLogin': ['.ImageId'], '.HostName': ['.ImageId', '.InstanceCount'], '.VirtualPrivateCloud': ['.InstanceCount'], '.UserData': ['.AppId'], '.AvailableZone': ['.AppId', '.ZoneId', '.InstanceChargeType'], '.DisasterRecoverGroupIds': ['.AppId', '.InstanceCount'], '.EnhancedService.SecurityService.Enabled': ['.ImageId'], '.EnhancedService.MonitorService.Enabled': ['.ImageId'], '.ActionTimer': ['.InstanceChargeType']}

print(compose(a, req))
print("--------")
print(compose_join_table(a, req))

#def test_compose1():
#    a = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'l', 'k')
#    req = {'l': ('a', 'c', 'k'), 'f': ('a', 'j', 'l'), 'e': ('k'), 'j': ('e')}
#    return compose(a, req) 
#def test_compose2():
#    a = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'l', 'k')
#    req = {'l': ('a', 'c', 'k'), 'f': ('a', 'j', 'l'), 'e': ('k'), 'j': ('e')}
#    return compose_join_table(a, req)
#
##import doctest
##doctest.testmod()
##print ('MASTER Pandora loaded.')
#
#
#print(test_compose1())
#print(test_compose2())
#print(tuple(test_compose2()))
##{0: set(['a', 'c', 'b', 'd', 'g', 'i', 'h', 'k']), 1: set(['e', 'l']), 2: set(['j']), 3: set(['f'])}
##{0: [], 1: ['k', 'a', 'c', 'k'], 2: ['e'], 3: ['a', 'j', 'l']}
#
#
