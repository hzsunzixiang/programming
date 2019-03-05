# -*- coding: utf-8 -*-
import hashlib
import struct
import time
import datetime

# 再算一个
# Block #279067
# 这个网址的信息全 但是时间戳不准确
#https://www.blockchain.com/en/btc/block/000000000000000027d4d014f6245170390ea904cec17d1761021d28049c20b9


# 但是时间戳是准的
# 注意这里的 Merkle Root 显示不全 直接复制是全的
# 查找上一个block的hash得点进去看
#https://blockexplorer.com/block/000000000000000027d4d014f6245170390ea904cec17d1761021d28049c20b9


ver = 2
prev_block = "0000000000000001c1d4289fd0db42581bc204ced2528f844d54e5e390abe510"
mrkl_root = "82daada057bd7aa09a6846e8ce3ea6f67ec1fd00cf392a8dd79aca779feb0d44"

#print( datetime.datetime.fromtimestamp( int("1389075720")).strftime('%Y-%m-%d %H:%M:%S'))
# https://stackoverflow.com/questions/9637838/convert-string-date-to-timestamp-in-python
#Jan 7, 2014 2:09:09 PM
myDate = "2014-01-07 14:09:09"
time_ = int(time.mktime(datetime.datetime.strptime(myDate, "%Y-%m-%d %H:%M:%S").timetuple()))
#time_ = 1389075720 # Mon Jan 06 22:22:00 2014
bits = 419628831 
#bits = 0x1903071f 
p = ''

# https://en.bitcoin.it/wiki/Difficulty
exp = bits >> 24
mant = bits & 0xffffff
target = mant * (1<<(8*(exp - 3)))
target_hexstr = '%064x' % target
print target_hexstr
target_str = target_hexstr.decode('hex')
print repr(target_str)

#nonce = 100000000
nonce =614959690 
while 1:
    nonce += 1
    header = ( struct.pack("<L", ver) + prev_block.decode('hex')[::-1] +
          mrkl_root.decode('hex')[::-1] + struct.pack("<LLL", time_, bits, nonce))

    hash = hashlib.sha256(hashlib.sha256(header).digest()).digest()

    if nonce == 0:
        print nonce, hash[::-1].encode('hex_codec')


    if hash[::-1].encode('hex_codec').startswith(p):
        print nonce, hash[::-1].encode('hex_codec')
        p += '0'
    if hash[::-1] < target_str:
        print 'done', nonce
        break



