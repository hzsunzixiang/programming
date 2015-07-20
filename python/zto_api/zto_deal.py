#!/usr/bin/env python
# -*- coding:UTF-8
#coding=gbk
import httplib
import traceback
import json
import base64
import md5
import os
import urllib



#http://116.228.70.118:9001/zto/api_utf8/commonOrder

headers={}
headers["accept"] = '*/*'  
headers["connection"] = 'Keep-Alive'
headers["Accept-Charset"] =  'UTF-8'
headers["Content-Type"] = 'application/x-www-form-urlencoded'


#"mailNo": "1000000000016",

wl_info = {
    "partnerCode": "1124210041",
  	"sender": {
    "name": "李琳",
    "mobile": "13912345678",
    "prov": "上海市",
    "city": "上海市",
    "county": "青浦区",
    "address": "华新镇华志路123号",
    },
}
#wl_info = {
#	"items": [],
#	"orderSum": 2200,
#	"partnerCode": "71092",
#	"receiver": {
#		"address": "etst",
#		"city": "北京市",
#		"county": "通州区",
#		"mobile": "12453698745",
#		"name": "uuu",
#		"phone": "",
#		"prov": "北京",
#		"zipcode": "111111"
#	},
#	"sender": {
#		"address": "85号",
#		"city": "深圳市",
#		"county": "南山区",
#		"id": 795019790,
#		"mobile": "13510618371",
#		"name": "张山",
#		"phone": "010-888888888",
#		"prov": "广东",
#		"zipcode": "518000"
#	},
#	"tradeId": "2201195901201507020606147329",
#	"type": "1"
#} 
#http://116.228.70.118:9001/zto/api_utf8/commonOrder
#wl_info = {"orderSum":2200,"partnerCode":"71098","receiver":{"address":"etst","city":"北京市","county":"通州区","mobile":"12453698745","name":"uuu","phone":"","prov":"北京","zipcode":"111111"},"sender":{"address":"85号","city":"深圳市","county":"南山区","id":795019790,"mobile":"13510618371","name":"张山","phone":"010-888888888","prov":"广东","zipcode":"518000"},"tradeId":"2201195901201507020606147342","type":"1"} 




#wl_info = {"items":[{"name":"宅急送，有红包11111免运费   ","quantity":1,"unitprice":5000},{"name":"宅急送免运费用红包 宅急送免运费用红包  宅急宅急急      ","quantity":1,"unitprice":2000}],"orderSum":5500,"partnerCode":"76011","receiver":{"address":"货到付款退货xxxx街道办11113333号","city":"深圳市","county":"罗湖区","mobile":"13222222222","name":"timmy","phone":"0755-86689999-88888","prov":"广东","zipcode":"518888"},"sender":{"address":"85号","city":"深圳市","county":"南山区","id":795019790,"mobile":"13510618371","name":"张山","phone":"010-888888888","prov":"广东","zipcode":"518000"},"starttime":"2015-07-08 16:52:41","tradeId":"2201195901201507080606147705","type":"1"}
wl_info_json =json.dumps(wl_info)
company_id = "PAIPAIWANG"
key = "lxwsnhPmYlCUnWHIO8CykA=="



zto_ip = "116.228.70.118"
zto_port = 9001
#zto_ip = "japi.zto.cn"
#zto_port = 80 
url = "/zto/api_utf8/commonOrder"
msg_type = "CREATE"



def encryptBASE64(data, sign): 
	stringSign = data + sign
	print 'stringSign=', stringSign
	stringUtf8 = stringSign.encode("utf8")
	m = md5.new()
	m.update(stringUtf8)
	#base64Res = base64.b64encode(m.digest())
	#print "md5sum:", m.digest()
	base64Res = base64.encodestring(m.digest())
	
	print "len(base64Res)", len(base64Res)
	# 转换为windows下的换行符 
	if os.linesep == '\n':
		print "os.linesep == \\n"
		base64Res = base64Res.replace('\n', '\r\n')		
	print "len(base64Res)", len(base64Res)
	print "base64Res", base64Res
	return base64Res
	

try: 
	data_digest= encryptBASE64(wl_info_json, key) 

	print 'wl_info_json=', wl_info_json 
	#body = urllib.urlencode({'company_id': company_id, 'data_digest': data_digest, 'msg_type': msg_type, 'data': wl_info_json.encode("utf8")})
	body = urllib.urlencode({'company_id': company_id, 'data_digest': data_digest, 'msg_type': msg_type, 'data': wl_info_json})
	conn = httplib.HTTPConnection(zto_ip, zto_port, timeout = 10)
	print "ip:port",zto_ip,zto_port
	print "body:", body 
	print "header:", headers
	print "url:", url
	conn.request('POST', url, body = body,  headers = headers)
	response = conn.getresponse()
	responseBody = response.read()
	code = response.status
	print "respons:",responseBody
	conn.close()
except Exception, e:
	errMesg = traceback.format_exc()
	print errMesg	


#1. 签名错误直接返回
#
#   S01	非法的JSON格式
#   S02	非法的数字签名
#   S03	非法的物流公司
#   S04	非法的通知类型
#   S05	非法的通知内容
#   S07	系统异常,请重试
#   S08	非法的电商平台
#   
#
#2. 报错时返回为 false
#{"orderCode":null,"reason":"寄件省市区为空","result":false}
#
#3. 正确时返回true
#{"orderCode":"ZT15061900043346","reason":null,"result":true}
#
