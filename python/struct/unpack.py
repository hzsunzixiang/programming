#!/usr/bin/env python
# coding=utf-8


import ctypes
import struct 
from ctypes import *

data='{}'
strlen = ctypes.CDLL(None).strlen
print strlen(data)
value = (strlen(data) + 8, 0, data)
print value
s = struct.Struct('>LL%ss' % strlen(data))
print s
a = s.pack(*value)

newFile = open("filename.bin", "wb")
# write to file
newFile.write(a)



##### begin unpack
r = struct.Struct('>LL')
#buf = a[8] 
buf = a[0:8]
print r.unpack(buf)[0]
data_length = r.unpack(buf)[0] - 8
print data_length
#data = b''
#buf_length = 0
