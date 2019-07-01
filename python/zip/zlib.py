#!/usr/bin/env python
# -*- coding:UTF-8

import zlib
s = 'Hello,world, there is a very very very very long long long long sentence'
zlib_s = zlib.compress(s)
print("sizeof(zlib_s): %s"%(len(zlib_s)))


ss = zlib.decompress(zlib_s)
print("(ss): %s"%(ss))
print("sizeof(ss): %s"%(len(ss)))
