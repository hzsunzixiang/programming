#!/usr/bin/env python
# -*- coding:UTF-8

# http://www.pengshuo.me/2014/04/22/openssl%e7%bc%96%e7%a8%8b-%e7%ac%ac%e5%8d%81%e5%85%ab%e7%ab%a0-dsa/


# 平方乘算法
def square_multi(base, exp):
    init=0  #初始化设置
    result=0
    for b in str(bin(exp)[2:]):
        if (b=='1') and (init==0):
           init=1
           result=base
        elif (b=='1') and (init==1):
           result=result**2
           result=result*base
        else:
           result=result**2
    return result


# 这几个参数有待于研究
# 拉格朗日定理  循环子群
#Private-Key: (2048 bit)
#priv:
#    40:4d:cd:00:61:be:1e:3d:4e:5d:ac:63:22:60:0d:
#    44:2c:1f:55:fd:15:b5:ec:c3:d6:ad:52:b5:27:cf:
#    44:b8
#pub: 
#    71:fd:06:b1:b4:c4:ea:7b:39:2b:6f:33:48:60:63:
#    db:6f:e3:18:55:90:46:bf:75:0e:4b:23:6d:59:b8:
#    83:ca:91:74:b3:e8:c9:fc:78:8a:a2:b9:26:d2:ea:
#    dd:d3:6f:a7:61:0e:6d:91:82:28:18:a6:95:26:05:
#    7d:65:c4:fe:1f:7e:76:20:ac:54:16:4c:21:ea:2c:
#    27:78:3e:eb:58:88:0a:37:58:b7:b8:f5:70:38:3c:
#    96:4f:37:75:6f:5b:33:1d:2a:fd:a9:bc:10:4e:99:
#    d1:a7:fb:2d:29:ab:f9:01:7f:ac:13:cf:87:b4:a6:
#    d1:88:38:c1:6a:a5:2e:13:0a:3c:a1:b8:b8:8c:e8:
#    30:f9:82:20:0c:5d:ba:73:69:93:4a:f4:ae:e1:5a:
#    83:96:38:74:b0:c0:4d:1f:d5:7c:f7:52:5b:46:e4:
#    ad:d4:f5:7c:89:2f:ef:a6:98:be:33:0c:22:28:21:
#    45:ad:a2:58:9a:1a:2d:28:16:c4:70:16:43:41:a8:
#    48:2d:e9:ad:72:ed:1d:63:6a:78:36:b9:12:18:93:
#    2c:56:5c:2b:5a:5a:b0:3c:a5:70:4c:a5:da:13:90:
#    4e:0b:bd:62:88:d9:9a:98:27:b7:51:de:19:bb:7c:
#    16:5c:e3:d9:10:f9:4f:43:d6:16:6d:ef:03:aa:89:
#    5b
#P:   
#    00:e7:9d:25:ca:54:7d:c8:93:18:50:ea:aa:67:84:
#    e3:65:ee:cf:69:37:42:43:d9:02:c1:2d:f7:d4:89:
#    6a:9e:5b:87:17:c4:c7:b2:4e:30:d1:b4:68:06:18:
#    38:f5:bc:76:df:05:0e:f6:b7:c5:81:05:ee:2c:f2:
#    3e:cb:67:e7:d8:98:30:a0:97:6f:60:6e:19:4d:0b:
#    85:e6:56:6c:ca:62:75:b7:b1:84:41:63:37:fc:7a:
#    c3:7b:eb:e9:c9:f7:6e:98:2b:9a:82:ee:0a:90:49:
#    00:a0:a7:f7:6f:47:60:e7:61:20:ec:d2:73:2a:1d:
#    fe:9a:1d:fa:56:87:57:69:06:70:46:06:88:20:5a:
#    7e:0d:74:4f:ea:cd:c2:74:16:a2:7a:fe:52:33:dd:
#    58:94:58:01:af:83:c7:fd:71:99:dc:be:d0:08:19:
#    75:0c:81:cd:3f:2b:5d:68:c2:9c:d4:3e:03:5e:ed:
#    70:bf:d8:5f:55:25:9d:f9:53:f4:f6:9d:71:9e:be:
#    5c:06:b3:44:3d:24:9b:11:0e:60:2d:81:36:6e:a8:
#    84:07:ed:81:d3:cf:6f:6f:ce:a1:bb:7f:9a:f5:63:
#    d2:ca:43:6d:5c:2d:79:4f:06:40:7d:1f:11:1c:b2:
#    5a:86:f7:56:83:68:e0:85:eb:e3:1f:7e:b8:b9:be:
#    db:89
#Q:   
#    00:c3:92:50:92:25:61:c4:b5:6a:9c:1b:fb:0d:52:
#    3b:bf:e8:39:51:82:c5:46:4b:38:a1:d9:95:9a:a1:
#    21:87:1b
#G:   
#    6c:de:69:20:c6:1f:a8:0e:51:21:2d:e1:5b:e6:b2:
#    ac:a9:31:74:e3:fd:5d:47:9d:08:af:fb:57:22:23:
#    70:c9:04:7b:09:9e:a9:e9:d5:3b:69:49:15:96:77:
#    09:58:0b:77:a5:cf:d7:06:29:e1:30:8c:9d:b7:a9:
#    e8:c2:f4:1f:3c:7c:79:2c:9f:fe:9d:d6:69:5b:bc:
#    54:9d:2a:00:80:05:c1:8e:75:09:6c:9d:45:5d:e4:
#    d7:50:11:df:aa:4d:18:df:4e:e9:55:de:3d:a6:92:
#    b2:a4:90:84:28:57:94:d9:e5:3d:f1:99:b0:dd:55:
#    14:be:e1:e3:87:e8:97:d9:71:b6:e5:6f:9d:cb:49:
#    bf:8a:5a:44:70:bf:02:16:81:6b:4c:e1:ab:49:89:
#    57:cb:5d:cc:4e:f6:41:46:a1:a4:24:b2:d8:29:fe:
#    29:21:5e:99:85:90:21:30:53:73:56:18:df:90:48:
#    53:53:ce:e4:70:21:94:c4:de:66:bd:77:c3:d9:cf:
#    0f:a4:5e:f4:b6:4b:5c:41:18:67:35:b4:68:05:d2:
#    ea:f9:15:42:50:7a:28:80:5d:b5:83:8a:c3:d1:7e:
#    d3:22:77:64:f5:b8:0d:19:d8:f7:52:f5:8f:01:ee:
#    c5:ba:12:a4:c8:37:5a:5a:47:b1:1f:0d:c3:6c:26:
#    79

priv = 0x404dcd0061be1e3d4e5dac6322600d442c1f55fd15b5ecc3d6ad52b527cf44b8
pub = 0x71fd06b1b4c4ea7b392b6f33486063db6fe318559046bf750e4b236d59b883ca9174b3e8c9fc788aa2b926d2eaddd36fa7610e6d91822818a69526057d65c4fe1f7e7620ac54164c21ea2c27783eeb58880a3758b7b8f570383c964f37756f5b331d2afda9bc104e99d1a7fb2d29abf9017fac13cf87b4a6d18838c16aa52e130a3ca1b8b88ce830f982200c5dba7369934af4aee15a83963874b0c04d1fd57cf7525b46e4add4f57c892fefa698be330c22282145ada2589a1a2d2816c470164341a8482de9ad72ed1d636a7836b91218932c565c2b5a5ab03ca5704ca5da13904e0bbd6288d99a9827b751de19bb7c165ce3d910f94f43d6166def03aa895b

P   =0x00e79d25ca547dc8931850eaaa6784e365eecf69374243d902c12df7d4896a9e5b8717c4c7b24e30d1b468061838f5bc76df050ef6b7c58105ee2cf23ecb67e7d89830a0976f606e194d0b85e6566cca6275b7b184416337fc7ac37bebe9c9f76e982b9a82ee0a904900a0a7f76f4760e76120ecd2732a1dfe9a1dfa568757690670460688205a7e0d744feacdc27416a27afe5233dd58945801af83c7fd7199dcbed00819750c81cd3f2b5d68c29cd43e035eed70bfd85f55259df953f4f69d719ebe5c06b3443d249b110e602d81366ea88407ed81d3cf6f6fcea1bb7f9af563d2ca436d5c2d794f06407d1f111cb25a86f7568368e085ebe31f7eb8b9bedb89
Q  = 0x00c39250922561c4b56a9c1bfb0d523bbfe8395182c5464b38a1d9959aa121871b

G=0x6cde6920c61fa80e51212de15be6b2aca93174e3fd5d479d08affb57222370c9047b099ea9e9d53b694915967709580b77a5cfd70629e1308c9db7a9e8c2f41f3c7c792c9ffe9dd6695bbc549d2a008005c18e75096c9d455de4d75011dfaa4d18df4ee955de3da692b2a49084285794d9e53df199b0dd5514bee1e387e897d971b6e56f9dcb49bf8a5a4470bf0216816b4ce1ab498957cb5dcc4ef64146a1a424b2d829fe29215e998590213053735618df90485353cee4702194c4de66bd77c3d9cf0fa45ef4b64b5c41186735b46805d2eaf91542507a28805db5838ac3d17ed3227764f5b80d19d8f752f58f01eec5ba12a4c8375a5a47b11f0dc36c2679


# 验证第一点 Q能整除P-1  Q|(P-1)
# 也就是 Q是 P-1的一个素除数

print  ((P-1)/Q)*Q==(P-1)

# G是生成元， 即G生成了拥有Q个元素的子群 
# G^Q=1 (mod P)

# 这样暴力 算不出来 需要用平方乘算法 也就是快速指数算法 P169 深入浅出密码学
#print (G**Q)%P==1

# 这个很费时  需要用c语言的大数库 瞬间计算
print square_multi(G,Q)%P

# 验证公钥私钥
print square_multi(G,priv)%P




