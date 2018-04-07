

# 为了更好地查看两种签名对比
# 使用req12生成证书


# 用这个密钥来签署证书请求文件
openssl req -x509 -key pri_key_crt.pem -in req2.csr -out CA2.crt -days 365

openssl req -in req2.csr -text -noout
openssl x509  -in CA2.crt -text -noout

openssl req -in req2.csr -text -noout 
# 结果
#Certificate Request:
#    Data:
#        Version: 1 (0x0)
#        Subject: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.test1.com, emailAddress = haichengsun123@163.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#                Public-Key: (2048 bit)
#                Modulus:
#                    00:d8:32:cc:b5:76:ee:be:26:ce:44:7a:a7:29:47:
#                    ea:2a:22:0d:d9:d9:6a:dd:d6:64:4e:73:08:da:7b:
#                    37:20:6e:f5:89:4e:f8:62:e1:df:68:5b:16:05:32:
#                    2a:6f:fb:36:5e:22:3f:8f:18:9b:48:1c:73:c9:85:
#                    2b:28:c3:96:9a:b1:a7:eb:ef:10:de:12:39:cf:67:
#                    e4:10:e6:35:44:ed:64:e3:d7:90:29:79:d6:08:62:
#                    b3:a2:62:39:c2:b6:05:4b:53:ec:fa:32:9c:4a:0f:
#                    c0:e0:48:f5:85:c7:d2:5d:09:e9:0a:de:48:cd:a7:
#                    a2:c4:f0:bc:53:98:9d:a5:99:d3:95:48:79:a3:1e:
#                    67:34:96:b8:7b:4f:54:a2:3f:1e:6c:b4:19:1e:91:
#                    67:5e:ca:d8:29:e1:b0:57:df:25:11:9b:38:31:36:
#                    c4:d5:bc:9c:74:6e:26:da:f9:d4:8d:37:08:16:27:
#                    fe:cd:54:77:9e:74:83:65:cf:b5:26:d0:9b:b6:4a:
#                    01:7c:4b:da:d5:68:fe:37:90:53:c7:33:3b:12:fb:
#                    ea:0a:ca:30:1e:b0:fc:67:da:a9:57:3c:15:59:e5:
#                    06:22:42:1b:59:62:40:c5:30:48:91:96:86:dd:64:
#                    0f:a2:ac:d9:5e:e7:22:92:bb:ad:8a:f7:4e:9d:28:
#                    9d:f5
#                Exponent: 65537 (0x10001)
#        Attributes:
#            unstructuredName         :TC
#    Signature Algorithm: md5WithRSAEncryption
#         cb:62:c9:82:9c:03:07:d2:ce:99:fa:66:f5:77:5c:db:9d:b1:
#         81:e5:d9:57:b5:a3:fc:b2:34:7d:ad:b2:84:47:13:25:93:04:
#         98:3c:a1:01:9b:fb:6f:4b:97:99:f1:c1:e1:58:fe:64:59:9c:
#         c1:2a:70:d5:38:a8:b6:67:3d:5b:fd:e2:00:6f:5a:db:69:f7:
#         e0:a1:1b:ba:29:7d:d1:5a:ff:7d:0c:ac:d2:20:9a:a7:14:e7:
#         22:c2:27:a3:74:e9:ef:fb:55:5e:c6:16:e8:b7:a4:a7:c5:8a:
#         23:a2:5c:da:60:69:aa:13:85:65:2a:02:26:32:52:5c:61:bf:
#         0c:39:bc:81:c6:43:22:c4:ef:ff:e5:00:3e:13:92:52:6e:6b:
#         af:42:25:dc:96:db:1c:68:b7:dc:5e:42:69:5d:27:2d:e3:53:
#         ba:e3:cb:be:f6:ed:c9:a3:34:2a:b8:9c:8a:12:86:12:2b:9d:
#         4a:2e:b3:06:fe:de:cb:0d:9e:2f:c1:23:ab:d4:f1:e6:23:bb:
#         70:14:58:b8:fd:1d:d7:a3:a9:60:9b:d1:f5:4c:35:de:48:d7:
#         e4:7e:b0:6b:b4:d6:64:89:ab:a3:63:49:6f:2d:ed:e4:35:22:
#         45:c7:c0:85:93:71:61:27:79:c0:dd:8b:d2:f8:16:f8:fd:51:
#         44:51:22:16
openssl x509  -in CA2.crt -text -noout

#结果 发现 证书中没有了csr中的md5签名 而是 有自己的证书本身的签名
# 签名的是验证了 CSR文件的合法性，然后再用 CA时的私钥进行签名

#Certificate:
#    Data:
#        Version: 3 (0x2)
#        Serial Number:
#            c9:16:9e:5b:d2:cd:20:6e
#    Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.test1.com, emailAddress = haichengsun123@163.com
#        Validity
#            Not Before: Apr  7 23:32:37 2018 GMT
#            Not After : Apr  7 23:32:37 2019 GMT
#        Subject: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.test1.com, emailAddress = haichengsun123@163.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#                Public-Key: (2048 bit)
#                Modulus:
#                    00:d8:32:cc:b5:76:ee:be:26:ce:44:7a:a7:29:47:
#                    ea:2a:22:0d:d9:d9:6a:dd:d6:64:4e:73:08:da:7b:
#                    37:20:6e:f5:89:4e:f8:62:e1:df:68:5b:16:05:32:
#                    2a:6f:fb:36:5e:22:3f:8f:18:9b:48:1c:73:c9:85:
#                    2b:28:c3:96:9a:b1:a7:eb:ef:10:de:12:39:cf:67:
#                    e4:10:e6:35:44:ed:64:e3:d7:90:29:79:d6:08:62:
#                    b3:a2:62:39:c2:b6:05:4b:53:ec:fa:32:9c:4a:0f:
#                    c0:e0:48:f5:85:c7:d2:5d:09:e9:0a:de:48:cd:a7:
#                    a2:c4:f0:bc:53:98:9d:a5:99:d3:95:48:79:a3:1e:
#                    67:34:96:b8:7b:4f:54:a2:3f:1e:6c:b4:19:1e:91:
#                    67:5e:ca:d8:29:e1:b0:57:df:25:11:9b:38:31:36:
#                    c4:d5:bc:9c:74:6e:26:da:f9:d4:8d:37:08:16:27:
#                    fe:cd:54:77:9e:74:83:65:cf:b5:26:d0:9b:b6:4a:
#                    01:7c:4b:da:d5:68:fe:37:90:53:c7:33:3b:12:fb:
#                    ea:0a:ca:30:1e:b0:fc:67:da:a9:57:3c:15:59:e5:
#                    06:22:42:1b:59:62:40:c5:30:48:91:96:86:dd:64:
#                    0f:a2:ac:d9:5e:e7:22:92:bb:ad:8a:f7:4e:9d:28:
#                    9d:f5
#                Exponent: 65537 (0x10001)
#        X509v3 extensions:
#            X509v3 Subject Key Identifier: 
#                5F:1B:77:29:61:88:69:06:FB:B0:38:30:88:DE:0B:7F:66:BC:51:29
#            X509v3 Authority Key Identifier: 
#                keyid:5F:1B:77:29:61:88:69:06:FB:B0:38:30:88:DE:0B:7F:66:BC:51:29
#
#            X509v3 Basic Constraints: critical
#                CA:TRUE
#    Signature Algorithm: sha256WithRSAEncryption
#         1b:a9:00:05:10:c1:f1:d0:b2:c2:04:65:86:cd:e5:82:ed:9e:
#         46:f7:18:d2:c5:dd:2c:1a:e9:ae:0f:62:66:7c:38:3c:a7:2e:
#         c4:7f:ca:36:aa:a1:cb:1e:60:bd:9c:00:7d:98:bb:6c:1c:0d:
#         93:29:9c:6f:e4:04:1d:5a:e7:ca:01:c3:22:1c:d0:b1:55:20:
#         d3:8a:b3:67:43:a5:45:0b:de:68:c8:81:92:fa:63:d7:a2:81:
#         98:7e:7c:a9:9f:37:63:cb:d3:0c:dc:57:b0:19:64:31:50:ef:
#         01:c4:62:01:57:ab:f3:62:92:3d:fd:79:c8:ad:cc:b8:c5:37:
#         bb:e3:17:41:f9:33:61:f1:57:28:4e:1a:eb:85:f8:cc:8b:57:
#         9f:2a:74:4f:a3:7a:8f:9b:2e:2f:99:50:2b:ab:10:8b:cf:2a:
#         5b:2d:f5:56:1a:2b:7d:1f:2f:2f:87:9f:ac:db:c1:3a:b4:90:
#         ec:2f:d5:7f:d8:6b:f4:af:98:7b:b5:e1:1e:92:ca:e9:73:9b:
#         d4:5e:28:a7:9f:bd:47:75:57:48:c3:d3:f8:e5:2c:43:8e:a5:
#         b8:35:86:e7:7c:dd:a3:4a:e5:49:31:59:09:a0:8a:31:11:c2:
#         91:d6:cb:20:8f:a9:46:7d:c5:0e:5e:a3:10:5b:13:80:84:63:
#         17:52:47:f6





