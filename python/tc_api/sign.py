#!/usr/bin/env python
# -*- coding:UTF-8
#coding=gbk

import hashlib
#print hashlib.sha1("actid=320001130120161229020000000116&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180502164001567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#print hashlib.sha1("actid=320001130120161229020000000128&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180509150601567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000129&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180509193301567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000130&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180510111101567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
##红包的签名
#print hashlib.sha1("actid=320001130120161229020000000130&appid=wxaa16996d6b967ecb&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&order_time=1525921952&sign=80C074EB337C5AE788C2934BAB21F83F65189962&sp_listid=400000000320180510111101567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&hb_sign_key=aldkfj09a2454laid8l8240lywoa1l0k").hexdigest().upper()
##返回字符串的签名
#print hashlib.sha1("hb_url=http://hb.wechatpay.com.my/cgi-bin/my_wcerp_rpdtl_qry.cgi?rp_listid=400000000320180510111101567890oKz050ZsuETxI3wwIKZMDbSAa24I&hb_sign=887CA8771CE7B63FF6E76CC626B1AACB871BB87A&nonce_str=1cb16c2daa6d8edf771a50706dc90840&retcode=0&retmsg=OK&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000131&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180511095901567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#print hashlib.sha1("actid=320001130120161229020000000132&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180511161501567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000133&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180511165901567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000134&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=400000000320180514113001567890oKz050ZsuETxI3wwIKZMDbSAa24I&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000134&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051499114550ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("nonce_str=asdfgh&sp_listid=40000000032018051499114550ZsuE&spid=4000000003&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("nonce_str=asdfgh&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051499114550ZsuE&spid=4000000003&key=123456").hexdigest().upper()
#
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599104650ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599105550ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599110550ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599110750ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599111050ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599111120ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599111420ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599111820ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#print hashlib.sha1("actid=320001130120161229020000000135&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599112620ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
#
#
#
#print hashlib.sha1("actid=320001130120161229020000000133&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599155620ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()



print hashlib.sha1("actid=320001130120161229020000000136&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051599162920ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000136&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699095420ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()

print hashlib.sha1("actid=320001130120161229020000000136&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699095620ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000136&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699105720ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000136&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699110320ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000136&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699112420ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=4000000003201805169914920ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699115920ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()

print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699130320ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699143220ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()

print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24J&sp_listid=40000000032018051699151320ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()
print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=onqOjjkVqfLL9oM1nwNKthjSdt5Y&sp_listid=40000000032018051699151320ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=o3cuG1n62iw_ih98F5Mma_7QkYp8&sp_listid=40000000032018051699151320ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()

print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051699153120ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("actid=320001130120161229020000000137&nonce_str=zxvbnm&openid=oKz050ZsuETxI3wwIKZMDbSAa24I&sp_listid=40000000032018051799112520ZsuE&spid=4000000003&valid_time=100000&key=123456").hexdigest().upper()


print hashlib.sha1("act_listid=320001130120180706020000000001&is_reissue=0&openid=o5PXlsqwUgWKfNXpvnpEUOhklrUM&send_type=4&spid=3200011301&spidpay_listid=320001130120180706095406000003o5PXlsqwUgWKfNXpvnpEUOhklrUM&key=1111222233334444aaaabbbbccccdddd").hexdigest().upper()
