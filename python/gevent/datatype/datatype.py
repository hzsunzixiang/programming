# coding:utf-8

import copy

from business.common import util
from business.common import snapshot
from business.common import instance, vpc
from business.common import security
from business.common import host
from business.cvm import const as CVM_CONST
from business.eip import const as EIP_CONST
from framework import context
from framework.log import debug
from . import bone
from . import exception

# 因为这些 DataType 是用于关键的参数检验与过滤的 + 偷懒的自动文档生成，不会担心有人不用而导致荒废，所以我相信大家会一直维护下去。
# DataType又是自省的。可以说是非常好的自注释的典型范例。

attrs_whitelist = ['match', 'match_ex']


class MetaDataType(type):

    def __new__(mcs, name, bases, dct):
        _ = [(k, v) for k, v in list(dct.items())
             if '__' not in k and k not in attrs_whitelist]
        dct['attrs'] = {}
        for k, v in _:
            dct['attrs'][k] = v

        return type.__new__(mcs, name, bases, dct)


class DataType(object, metaclass=MetaDataType):
    """基本DataType"""

    def __init__(self,
                 required=False,
                 default=None,
                 validator=None,
                 optional=None,
                 autofill=False,  # 是否自动填充
                 disable=None,
                 deprecated=False,
                 list_limit=10,
                 list_validator=None,
                 mutex=None,
                 requirements={},
                 **wargs):

        if bool(default) and required:
            raise exception.InvalidParameterValue(
                'Required value should not has a default value.')
        self.nullable = not required
        self.optional = optional
        self.validator = validator
        self.autofill = True if default is not None else autofill
        self.default_value = default
        self.disable = [] if not disable else disable
        self.list_limit = list_limit
        self.deprecated = deprecated
        self.mutex = [] if not mutex else mutex
        self.list_validator = list_validator
        self.desc = wargs['desc'] if wargs.get('desc') else self.__doc__
        self.requirements = requirements

    def abspath_list_validator(self, key, data):
        try:
            _data = bone.get_path_point(data, key)
            _data = list(bone.convert_dicts_to_lists(
                copy.deepcopy(_data)).values())
            _v = self.list_validator
            if isinstance(_v, list):
                validators = _v
            else:
                validators = [_v]
            for _validator in validators:
                _validator(key, _data)

        except KeyError:
            raise

    def auto_convert(self, data):
        return data

    def abspath_validator(self, key, data):
        try:
            _data = bone.get_path_point(data, key)
            _data = self.auto_convert(_data)
            if isinstance(_data, list):
                _v = self.list_validator
            else:
                _v = self.validator
            if isinstance(_v, list):
                validators = _v
            else:
                validators = [_v]
            for _validator in validators:
                _validator(key, _data)

        except KeyError:
            raise

    def match_ex(self, key, data):
        debug(f'{key} 分解EX')
        _data = bone.get_path_point(data, key)
        if self.optional:
            if _data not in self.optional:
                raise exception.InvalidParameterValue(
                    parameter=key, value=_data)
        _ = self.match(key, data)

        return _

    def match(self, key, data):
        bone.schema_core_loop(
            bone.create_virtual_point(key, self.__class__.attrs),  # 规则字典,
            data,  # 源数据字典,
            path=key,  # 当前递归的节点
        )
        return _


class Root(DataType):
    # (TODO) 根 DataType。
    pass


class String(DataType):
    """字符串类型"""

    def match(self, key, data):
        _data = bone.get_path_point(data, key)
        if not isinstance(_data, str):
            raise exception.InvalidParameterValue(parameter=key, value=_data)
        default = self.default_value
        if data:
            bone.write_context(key, _data)
            return
        if default:
            bone.write_context(key, default(key) if callable(
                default) else default)


class Integer(DataType):
    """整数类型"""

    def match(self, key, data):
        _data = bone.get_path_point(data, key)
        is_integer = isinstance(_data, int) or (
            isinstance(_data, str) and _data.isdigit())
        if not is_integer:
            raise exception.InvalidParameterValue(parameter=key, value=_data)
        default = self.default_value
        if data:
            bone.write_context(key, int(_data))
            return
        if self.default_value:
            bone.write_context(key, default(key) if callable(
                default) else default)

    def match_ex(self, key, data):
        debug(f'{key} 分解EX')
        _data = bone.get_path_point(data, key)
        if self.optional:
            if str(_data) not in map(str, self.optional):
                raise exception.InvalidParameterValue(
                    parameter=key, value=_data)
        _ = self.match(key, data)
        return _


class Boolean(DataType):
    """布尔类型"""

    def auto_convert(self, _data):
        if _data in {'True', True, 'TRUE', 'true'}:
            return True
        if _data in {'False', False, 'FALSE', 'false'}:
            return False

    def match(self, key, data):
        _data = bone.get_path_point(data, key)
        if _data in {'True', True, 'TRUE', 'true'}:
            bone.write_context(key, True)
            return
        if _data in {'False', False, 'FALSE', 'false'}:
            bone.write_context(key, False)
            return
        raise exception.InvalidParameterValue(parameter=key, value=_data)


class KvType(DataType):
    Name = String(required=True)
    Value = String(required=True)


class Filter(DataType):
    """查询过滤器"""

    def __init__(self, filter_values_limit=None, extend=False, **wargs):
        super().__init__(**wargs)
        self.enable_filter_extend = extend
        self.filter_values_limit = filter_values_limit

    def match(self, key, data):
        return data

    def match_ex(self, key, data):
        name_key = 'Name'
        values_key = 'Values'
        data = bone.get_path_point(data, key)
        if not isinstance(data, dict):
            raise exception.InvalidFilter(
                message='InvalidFilterNotDict', value=data)

        if [name_key, values_key] != sorted(data.keys()):
            raise exception.InvalidFilter(
                message='InvalidFilterInvalidKey', value=data)

        name = data[name_key]
        values = data[values_key]
        if not isinstance(name, str):
            raise exception.InvalidFilter(
                message='InvalidFilterInvalidNameNotStr', value=name)

        if self.enable_filter_extend: 
            pass
        else:
            if not isinstance(values, list):
                raise exception.InvalidFilter(
                    message='InvalidFilterInvalidValuesNotList', name=name, value=values)
        # list 不允许为空列表
        if not values:
            raise exception.InvalidParameterValue(parameter=name, value=values)
        # HACK 时间比较赶不好做大改动 ###############
        if self.filter_values_limit is None:
            if util.is_mc_request_source_user():
                tmp_filter_values_limit = util.FILTER_LIST_VALUE_LIST_LIMIT_DEFAULT_FOR_MC
            else:
                tmp_filter_values_limit = util.FILTER_LIST_VALUE_LIST_LIMIT_DEFAULT
        else:
            tmp_filter_values_limit = self.filter_values_limit
        #############################################

        if self.enable_filter_extend: 
            pass
        else:
            if len(values) > tmp_filter_values_limit:
                raise exception.InvalidFilterValueLimitExceeded(
                    name=name, value=values, limit=tmp_filter_values_limit)

        if self.optional:
            assert isinstance(
                self.optional, dict), 'Filter optional is not a dict.'

            if name not in self.optional.keys():
                raise exception.InvalidFilter(
                    message='InvalidFilterNotSupportedName', value=name)

            validator = self.optional[name]
            if callable(validator):
                for value in values:
                    validator(name, value)

        if callable(self.validator):
            self.validator(key, data)

        if data:
            bone.write_context(key, data)


class Order(DataType):

    def __init__(self, **wargs):
        super().__init__(**wargs)


    def match(self, key, data):
        return data


    def match_ex(self, key, data):
        data = bone.get_path_point(data, key)
        if not isinstance(data, dict):
            raise exception.InvalidParameterValue(parameter=key, value=data)

        # 框架已经调用validator，这里不需要重复调用
        # if callable(self.validator):
        #    self.validator(key, data)

        if data:
            bone.write_context(key, data)

#----------------------------------下面是业务DataType--------------------------



class InstanceChargePrepaid(DataType):

    def get_renewflag_default(self):
        if context.Action in ('RenewInstance', 'InquiryPriceRenewInstance'):
            return None
        else:
            return 'NOTIFY_AND_MANUAL_RENEW'

    Period = Integer(required=True, validator=instance.validate_period)
    TimeUnit = String(default=util.TIME_UNIT_MONTH, optional=util.TIME_UNIT_MAP.keys())
    RenewFlag = String(
        default=get_renewflag_default,
        optional=CVM_CONST.RENEW_FLAG_MAP.keys())


class ChargePrepaid(DataType):

    def get_renewflag_default(self):
        if context.Action in ('RenewInstance', 'InquiryPriceRenewInstance'):
            return None
        else:
            return 'NOTIFY_AND_MANUAL_RENEW'

    Period = Integer(required=True, validator=instance.validate_period)
    TimeUnit = String(default=util.TIME_UNIT_MONTH, optional=util.TIME_UNIT_MAP.keys())
    RenewFlag = String(
        default=get_renewflag_default,
        optional=CVM_CONST.RENEW_FLAG_MAP.keys())


class Externals(DataType):
    ReleaseAddress = Boolean(required=False, default=False)

class ActionTimer(DataType):
    TimerAction = String(required=False, optional=CVM_CONST.INSTANCE_TIMER_ACTION_TYPES)
    ActionTime = String(required=False, validator=instance.validate_action_timer_time)
    Externals = Externals(required=False)


class Placement(DataType):
    Zone = String(required=True, validator=instance.validate_zone_id)
    ProjectId = Integer(default=0, validator=instance.validate_project_id)
    HostIds = [String(validator=host.validate_host_id, list_limit=CVM_CONST.MAX_HOSTID_FOR_RUN_INSTANCES)]
    HostIps = [String(validator=host.validate_host_ip, list_limit=CVM_CONST.MAX_HOSTID_FOR_RUN_INSTANCES)]


class SystemDisk(DataType):
    """描述了系统盘的数据结构"""
    DiskType = String(default='LOCAL_BASIC',
                      optional=CVM_CONST.DISK_TYPE_MAP.keys(),
                      disable=['ResetInstance', 'InquiryPriceResetInstance', 'SwitchParameterResetInstance'])
    DiskSize = Integer(default=instance.get_default_system_disk_size)


class DataDisk(DataType):
    """描述了数据盘的数据结构"""
    DiskType = String(default=instance.get_default_data_disk_type,
                      optional=CVM_CONST.DISK_TYPE_MAP.keys(),
                      disable=['ResizeInstanceDisks', 'InquiryPriceResizeInstanceDisks', 'InquiryResourceResizeInstanceDisks', 'SwitchParameterResizeInstanceDisks'])
    DiskSize = Integer(default=0)
    SnapshotId = String(validator=snapshot.validate_snapshot_id)
    # DiskId 为了后续支持随实例购买多块数据盘时指定数据盘升级，暂时不加


class VirtualPrivateCloud(DataType):
    VpcId = String(required=False)
    SubnetId = String(required=False)
    AsVpcGateway = Boolean(default=False)
    PrivateIpAddresses = [String(validator=vpc.validate_ip_format)]


class SharePermissionSet(DataType):
    ShareTime = String(required=True, desc="分享时间")
    Account = String(required=True, desc="账户ID")


class InternetAccessible(DataType):
    """定义了实例对于公网的可访问性与相关的计费模式"""
    InternetChargeType = String(
        default=instance.get_default_internet_charge_type,
        optional=CVM_CONST.INTERNET_CHARGE_TYPE_MAP.keys(),
        disable=['ResetInstancesInternetMaxBandwidth', 'InquiryPriceResetInstancesInternetMaxBandwidth', 'SwitchParameterResetInstancesInternetMaxBandwidth',
                 'RenewInstances', 'InquiryPriceRenewInstances', 'SwitchParameterRenewInstances'])
    InternetMaxBandwidthOut = Integer(default=0)
    PublicIpAssigned = Boolean(
        default=instance.get_default_public_ip_assigned,
        validator=instance.validate_public_ip_assigned,
        disable=['ResetInstancesInternetMaxBandwidth', 'InquiryPriceResetInstancesInternetMaxBandwidth', 'SwitchParameterResetInstancesInternetMaxBandwidth',
                 'RenewInstances', 'InquiryPriceRenewInstances', 'SwitchParameterRenewInstances'])


class InternetAccessibleModifyChargeType(DataType):
    InternetChargeType = String(required=True)
    InternetMaxBandwidthOut = Integer(required=True)


class LoginSettings(DataType):
    Password = String(validator=instance.validate_password)
    EncryptedWord = String(default=instance.encrypt_password)
    KeyIds = [String(validator=security.validate_key_id)]
    KeepImageLogin = Boolean(
        default=False,
        validator=instance.validate_keep_image_login)


class RunSecurityServiceEnabled(DataType):
    Enabled = Boolean(default=instance.enable_if_public_image)


class RunMonitorServiceEnabled(DataType):
    Enabled = Boolean(default=instance.enable_if_public_image)


class RunBasicServiceEnabled(DataType):
    Enabled = Boolean(default=True)


class EnhancedService(DataType):
    SecurityService = RunSecurityServiceEnabled(autofill=True)
    MonitorService = RunMonitorServiceEnabled(autofill=True)
    BasicService = RunBasicServiceEnabled(autofill=True)


class Price(DataType):
    OriginalPrice = Integer()
    DiscountPrice = Integer()


class SharePermission(DataType):
    AccountId = String(desc="账户ID")
    CreatedTime = String(desc="共享时间")


class Address(DataType):
    pass


class Image(DataType):
    "一个关于镜像详细信息的结构体，主要包括镜像的主要状态与属性"
    ImageId = String(desc='镜像ID')
    OsName = String(desc='操作系统名称')
    ImageType = String(desc='操作系统类型')
    CreatedTime = String(desc="创建时间")
    ImageStatus = String(desc="镜像状态")
    ImageName = String(desc="镜像名称")
    ImageDescription = String(desc="镜像详细描述")
    ImageCreator = String(desc="镜像的创建者")


class AddressChargePrepaid(DataType):
    Period = Integer(required=True, desc='购买实例的时长', optional=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 24, 36])
    RenewFlag = String(desc='自动续费标志')


class AddressConfig(DataType):
    ChargeType = String(optional=EIP_CONST.INTERNET_CHARGE_TYPE_MAP.keys())
    Bandwidth = Integer()
    StartTime = String()
    EndTime = String()
    ModifyMode = String()


class AddressGoodsDetail(DataType):
    Pid = Integer(desc='价格模型ID')
    GoodsNum = Integer(desc='资源实例个数')
    TimeSpan = Integer(desc='商品的时间大小')
    TimeUnit = String(desc='商品的时间单位', optional=['s', 'h', 'd', 'm', 'y'])
    Bandwidth = Integer()
    ChargeType = String(optional=EIP_CONST.INTERNET_CHARGE_TYPE_MAP.keys())
    CurrentDeadline = String(desc='当前到期时间，续费必传')
    NewConfig = AddressConfig()
    OldConfig = AddressConfig()
    ResourceId = String()


class AddressGoods(DataType):
    AppId = Integer(desc='云平台应用ID')
    Uin = String(desc='用户标识')
    # OwnerUin = String(desc='资源实际拥有者', required=True)
    OperateUin = String(desc='订单实际操作者')
    GoodsCategoryId = Integer(desc='商品ID')
    RegionId = Integer(desc='地域ID', required=True)
    ZoneId = Integer(desc='区域ID', required=True)
    ResourceId = String(desc='资源ID')
    PayMode = Integer(desc='付费模式', optional=[0, 1], required=True)
    ProjectId = Integer(desc='云平台项目ID，若无项目概念，则默认为0', default=0, required=True)
    GoodsDetail = AddressGoodsDetail(required=True)


if __name__ == '__main__':
    r = {}
    key = ''

    a = {
        'Placement': Placement(),
    }

    b = {
        'SystemDisk': {
            'Size': 50
        },
        'DataDisk': {},
        'DiskSize': 4,
        'DataDisks': [{}],
        'Setting': '555',
        'Placement': {
            'Host': {
                'name': 'ff',
                'dd': 'ff'
            },
            'Zone': '4',
            'AvailabilityZone': '333'
        },
        'fff': 'xxxx'
    }
    try:
        r = bone.schema_core_loop(a, b, key)
    except AssertionError:
        raise
    except:
        raise exception.InternServerException()
    print(r)

