#!/usr/bin/env python3
#def action(url='http://api.qcloud.com/v2', inquiryable=False, switchable=False, inquiryresourceable=False, **args):
#    def _(func):
#        assert func.__name__ == 'entry', "API 入口必须以 entry 作为函数名，而不能是 %s。" % func.__name__
#        print('识别到 %s 入口点并挂载...' % func.name)
#        return func
#
#    return _
#
class schema(object):
#
#    @staticmethod
#    def request(**args):
#        def _(func):
#            source_file_path_elem = func.raw_func.__code__.co_filename.split(
#                '/')
#            if 'name' not in args:
#                name = source_file_path_elem[-1].split('.')[0]
#            else:
#                if '.' in args['name']:
#                    args['name'] = args['name'].split('.')[-1]
#                name = args['name']
#
#            def wrap_func(**input_args):
#
#                # TCE 运营端允许操作任意租户账号底下的机器
#                if input_args.get('AppId') == 1 and input_args.get('OperationAppId'):
#                    input_args['AppId'] = input_args.get('OperationAppId')
#                    input_args['Uin'] = input_args.get('OperationUin')
#                    input_args['SubAccountUin'] = input_args.get('OperationUin')
#                try:
#                    del input_args['OperationAppId']
#                except:
#                    pass
#                try:
#                    del input_args['OperationUin']
#                except:
#                    pass
#                context._used_deprecated_key_set = set()   # 用户是否有使用废弃的字段
#                context.Module = source_file_path_elem[-2]
#                context.Action = input_args.get('Action', name)
#                context.SeqId = input_args.get('seqId', get_current_request_id())
#                print('Call %s(%s) API' %
#                         (wrap_func.name, str(input_args)))
#
#                convert_dicts_to_lists(input_args)
#
#                log.info('Processed %s(%s) Recv args' %
#                         (wrap_func.name, str(input_args)))
#                if 'AppId' in context:
#                    input_args['AppId'] = context.AppId
#                    input_args['Uin'] = context.Uin
#                    input_args['SubAccountUin'] = context.SubAccountUin
#                    input_args['Region'] = context.Region
#                    input_args['RequestSource'] = context.RequestSource
#                else:
#                    context.RequestSource = input_args.get('RequestSource', '')
#
#                context._input_args = input_args
#                # TODO(skipzhang): 此处代码颇为不雅，计划排期解决。
#                # common_args是参数规则，只有规则才会写入context
#                common_args = {}
#                common_args['AppId'] = datatype.Integer(
#                    required=True) if 'AppId' not in args else args['AppId']
#                common_args["Uin"] = datatype.String(
#                    required=True) if 'Uin' not in args else args['Uin']
#                common_args["SubAccountUin"] = datatype.String(
#                    required=True) if 'SubAccountUin' not in args else args['SubAccountUin']
#                common_args["Region"] = datatype.String(
#                    required=True) if 'Region' not in args else args['Region']
#                common_args['Token'] = datatype.String(required=False)  if 'Token' not in args else args['Token']
#                common_args['ClientIp'] = datatype.String(required=False) if 'ClientIp' not in args else args['ClientIp']
#                common_args['Language'] = datatype.String(required=False) if 'Language' not in args else args['Language']
#                common_args['AssumerUin'] = datatype.String(required=False) if 'AssumerUin' not in args else args['AssumerUin']
#
#                schema_core_loop(
#                    common_args,
#                    input_args, '', strict=False)
#
#                schema_core_loop(
#                    args,
#                    input_args, '')
#                log.debug("普通参数校验运行完成")
#                req = func.flow_dct
#                log.debug(f"目前的上下文状态{context.args}")
#
#                start_lists, join_lists = pandora(
#                    req, list(context.delay.keys()))
#                abspath_to_datatype_map = context.delay
#                concurrency_worker_executor(
#                    start_lists, join_lists, abspath_to_datatype_map)
#
#                _args = copy.deepcopy(context.args)
#                _args = convert_dicts_to_lists(_args)
#
#                from framework import hook
#                hook.run_all()
#
#                result = func(**(_args))
#                log.info('Called %s API %s' % (wrap_func.name, str(result)))
#                context.response_time = int(round(time.time() * 1000))
#                #log.info('[apiv3] [%s] cost %d ms' % (wrap_func.name, context.response_time - context.request_time))
#                return result
#
#            wrap_func.__doc__ = func.__doc__
#            wrap_func.__name__ = func.__name__
#            wrap_func.raw_func = func.raw_func
#            wrap_func.recv = args
#            wrap_func.send = func.send
#
#            wrap_func.name = name
#
#            return wrap_func
#
#        return _
#
    @staticmethod
    def flow(dct=None):
        def _(func):

            func.flow_dct = dct if dct else {}
            return func

        return _

    @staticmethod
    def response(**args):
        print("in staticmethod response")
        def _(func):
            print("in inner function _")

            def wrap_func(**input_args):
                result = func(**input_args)
                return result

            wrap_func.__doc__ = func.__doc__
            wrap_func.raw_func = func
            wrap_func.__name__ = func.__name__
            wrap_func.send = args
            wrap_func.flow_dct = {}
            return wrap_func
        return _


#@action(desc='用于创建一台或多台指定配置的实例', inquiryable=True, switchable=True)
#@schema.request(
#    Uin=datatype.String(required=True, validator=instance.validate_account),
#    HostName=datatype.String(validator=instance.validate_host_name),
#    ClientToken=datatype.String(validator=instance.validate_client_token),
#    Placement=datatype.Placement(required=True),
#    InstanceChargePrepaid=datatype.InstanceChargePrepaid(),
#    InstanceChargeType=datatype.String(
#        default='POSTPAID_BY_HOUR',
#        optional=CVM_CONST.INSTANCE_CHARGE_TYPE_MAP.keys(),
#        validator=instance.validate_instance_charge_type),
#    InstanceType=datatype.String(
#        default='S1.SMALL1', validator=instance.validate_instance_type),
#    ImageId=datatype.String(required=True, validator=validate_image),
#    SystemDisk=datatype.SystemDisk(
#        validator=instance.validate_system_disk, autofill=True),
#    DataDisks=[datatype.DataDisk(
#        desc=_('CURRENTLY, ONLY ONE DATA DISK IS SUPPORTED.'),
#        list_validator=instance.validate_data_disks,
#        autofill=True, list_limit=CVM_CONST.MAX_DATADISK_FOR_RUN_INSTANCES)],
#    VirtualPrivateCloud=datatype.VirtualPrivateCloud(
#        validator=vpc.validate_vpc,
#        default=vpc.set_default_vpc,disable=["InquiryPriceRunInstances"]),
#    InternetAccessible=datatype.InternetAccessible(
#        validator=validate_internet_accessible,
#        autofill=True),
#    InstanceCount=datatype.Integer(
#        default=1, validator=instance.validate_instance_count),
#    InstanceName=datatype.String(
#        default='未命名', validator=instance.validate_instance_name),
#    LoginSettings=datatype.LoginSettings(
#        validator=instance.validate_login_settings),
#    SecurityGroupIds=[datatype.String(
#        validator=dfw.validate_security_group)],
#    EnhancedService=datatype.EnhancedService(autofill=True),
#    DryRun=datatype.Boolean(default=False),
#    UserData=datatype.String(validator=instance.validate_instance_user_data),
#    AvailableZone=datatype.String(validator=app.check_zone_is_visible),
#    PurchaseSource=datatype.String(default="cloudApi"),
#    DisasterRecoverGroupIds=[datatype.String(list_validator=instance.validate_instance_disaster_recover_group_ids)],
#    DesAction=datatype.String(default="apply"),
#    ActionTimer=datatype.ActionTimer(required=False, validator=validate_action_timer),
#)
#@schema.flow({
#    '.InstanceChargePrepaid.Period': ['.InstanceChargePrepaid.TimeUnit'],
#    '.InstanceChargeType': ['.Uin', '.Placement', '.InstanceChargePrepaid'],
#    '.SystemDisk.DiskSize': ['.ImageId', '.InstanceType', '.SystemDisk.DiskType'],
#    '.DataDisks.0.DiskType': ['.SystemDisk'],
#    '.DataDisks.0.DiskSize': ['.DataDisks.0.DiskType', '.InternetAccessible'],
#    '.InternetAccessible': ['.InstanceType', '.InstanceChargeType'],
#    '.InternetAccessible.PublicIpAssigned': ['.InternetAccessible.InternetMaxBandwidthOut', '.InstanceType'],
#    '.InstanceCount': ['.InstanceChargeType', '.ClientToken', '.InstanceType'],
#    '.LoginSettings.Password': ['.ImageId'],
#    '.LoginSettings.EncryptedWord': ['.LoginSettings.Password'],
#    '.LoginSettings.KeyIds.0': ['.ImageId'],
#    '.LoginSettings.KeepImageLogin': ['.ImageId'],
#    '.HostName': ['.ImageId', '.InstanceCount'],
#    '.VirtualPrivateCloud': ['.InstanceCount'],
#    '.UserData': ['.AppId'],
#    '.AvailableZone': ['.AppId', '.ZoneId', '.InstanceChargeType'],
#    '.DisasterRecoverGroupIds': ['.AppId', '.InstanceCount'],
#    '.EnhancedService.SecurityService.Enabled': ['.ImageId'],
#    '.EnhancedService.MonitorService.Enabled': ['.ImageId'],
#    '.ActionTimer': ['.InstanceChargeType'],
#})
#@schema.response(
#    InstanceIdSet=[datatype.String()],
#    Price=datatype.Price(),
#    RequestId=datatype.String())
#def entry(**args):
#    return {
#        'PREPAID': run_instance_prepaid,
#        'POSTPAID_BY_HOUR': run_instance_postpaid_by_hour,
#        'CDHPAID': run_instance_cdhpaid
#    }[args['InstanceChargeType']](args)
#



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
