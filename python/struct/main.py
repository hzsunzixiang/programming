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
#r = struct.Struct('>LL')
a = s.pack(*value)

newFile = open("filename.bin", "wb")
# write to file
newFile.write(a)
