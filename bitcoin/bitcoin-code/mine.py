# -*- coding: utf-8 -*-
import hashlib
import struct
import time


# block #279068 
#https://blockexplorer.com/block/0000000000000001a27b1d6eb8c405410398ece796e742da3b3e35363c2219ee
# 这个更清晰 
#https://www.blockchain.com/en/btc/block-index/341440

ver = 2
prev_block = "000000000000000027d4d014f6245170390ea904cec17d1761021d28049c20b9"
mrkl_root = "57ebfd5b7fed40fc07120b1b03550ea1069d74b2dfc8cf81dc25bb48cee4221f"
time_ = 1389075720 # Mon Jan 06 22:22:00 2014
bits = 419628831
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
nonce = 1730373790 
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



