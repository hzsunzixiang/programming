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



#http://180.166.232.222:9001/zto/api_utf8/commonOrder

headers={}
headers["accept"] = '*/*'  
headers["connection"] = 'Keep-Alive'
headers["Accept-Charset"] =  'UTF-8'
headers["Content-Type"] = 'application/x-www-form-urlencoded'


#wl_info = [{"partnerCode":"130520142013234","partnerId":"1004","fieldName":"status","fieldValue":"cancel","reason":"客户取消订单"}]
#wl_info = "358758561495","358758561495",
wl_info = {"orderCode": ["ZT15062300043778","ZT15062300043779"],"sendId":"frkj"}


#http://116.228.70.118:9001/zto/api_utf8/commonOrder

wl_info_json =json.dumps(wl_info)
company_id = "PAIPAIWANG"
key = "lxwsnhPmYlCUnWHIO8CykA=="



zto_ip = "116.228.70.118"
zto_port = 9001
url = "/zto/api_utf8/commonOrder"
msg_type = "SEARCHBYCODE"



def encryptBASE64(data, sign): 
	stringSign = data + sign
	print 'stringSign=', stringSign
	stringUtf8 = stringSign.encode("utf8")
	m = md5.new()
	m.update(stringUtf8)
	#base64Res = base64.b64encode(m.digest())
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

	body = urllib.urlencode({'company_id': company_id, 'data_digest': data_digest, 'msg_type': msg_type, 'data': wl_info_json})
	conn = httplib.HTTPConnection(zto_ip, zto_port, timeout = 10)
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
