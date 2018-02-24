#!/usr/bin/python
# -*- coding=UTF-8 -*-
if __name__ == '__main__':
    s = u'中国'
    s_gb = s.encode('gb2312')
    print s
    #print s_gb


    with open('utf8.bin', 'wb') as f:
        text = u'中国'
        f.write(text.encode('utf-8'))
        print text.encode('utf-8')

    with open('utf8.bin', 'rb') as f:
        data = f.read(16)
        text = data.decode('utf-8')
        print text

    with open('gb2312.bin', 'wb') as f:
        text = u'中国'
        f.write(text.encode('gb2312'))

    with open('gb2312.bin', 'rb') as f:
        data = f.read(16)
        text = data.decode('gb2312')
        print text





#  >>> a=u'中国'
#  >>> a
#  u'\u4e2d\u56fd'
# StephenSun@debian:~/programming/python/encoding$ hexdump  utf8.bin
# 0000000 b8e4 e5ad bd9b
# 0000006


