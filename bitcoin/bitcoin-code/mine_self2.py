# -*- coding: utf-8 -*-
import hashlib
import struct
import time
import datetime

# 再算一个
#https://en.bitcoin.it/wiki/Block_hashing_algorithm


# 但是时间戳是准的
# 注意这里的 Merkle Root 显示不全 直接复制是全的
# 查找上一个block的hash得点进去看
#https://blockexplorer.com/block/00000000000000001e8d6829a8a21adc5d38d0a473b144b6765798e61f98bd1d


ver = 2
prev_block = "00000000000008a3a41b85b8b29ad444def299fee21793cd8b9e567eab02cd81"
mrkl_root = "2b12fcf1b09288fcaff797d71e950e71ae42b91e8bdb2304758dfcffc2b620e3"

#print( datetime.datetime.fromtimestamp( int("1389075720")).strftime('%Y-%m-%d %H:%M:%S'))
# https://stackoverflow.com/questions/9637838/convert-string-date-to-timestamp-in-python
#Jan 7, 2014 2:09:09 PM
myDate = "2011-05-22 1:26:31"
time_ = int(time.mktime(datetime.datetime.strptime(myDate, "%Y-%m-%d %H:%M:%S").timetuple()))
#time_ = 1389075720 # Mon Jan 06 22:22:00 2014
bits = 0x1a44b9f2 
p = ''

# https://en.bitcoin.it/wiki/Difficulty
exp = bits >> 24
mant = bits & 0xffffff
target = mant * (1<<(8*(exp - 3)))
target_hexstr = '%064x' % target
print target_hexstr
target_str = target_hexstr.decode('hex')
print repr(target_str)

exit(0)
nonce = 2504433980
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



