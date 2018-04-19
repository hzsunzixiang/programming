


# 思考 是否也可以验证csr文件的  方式

# 这个申请一次就可以了
# 先申请私钥
# openssl genrsa -out private.key 2048

#### 我们这里用一个私钥 private.ke 来生成 csr文件,  
#### 用另一个私钥private_crt.key 生成crt文件

# 然后生成csr文件

# 这个证书请求文件中有用户的公钥信息   但不会有私钥信息

openssl req -new -key private.key -out req_ca_sign.csr

# 可以查看各种信息
openssl  req -in req_ca_sign.csr  -text -noout

# 里面包含公钥信息 和签名信息
#Certificate Request:
#    Data:
#        Version: 1 (0x0)
#        Subject: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.example.com, emailAddress = 17842379@qq.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#                Public-Key: (2048 bit)
#                Modulus:
#                    00:c4:e7:f4:b7:72:44:71:2e:12:c7:44:57:26:f5:
#                    e3:47:8c:44:b7:92:40:28:1b:b9:3f:f6:73:cc:c3:
#                    3f:89:7d:fe:bc:fa:1e:df:9c:10:be:32:8d:28:e1:
#                    1d:23:f9:70:12:b9:e8:92:1c:54:b7:86:7a:6b:8c:
#                    b4:dd:12:ff:58:72:31:7e:9d:cb:5d:0b:f0:ca:dc:
#                    69:4b:5e:d4:76:a0:31:06:8f:a2:79:28:30:d1:8f:
#                    99:e7:83:87:16:54:38:19:78:06:55:03:56:b0:d9:
#                    51:63:6e:84:0d:e6:e6:75:6f:d5:4c:6f:38:5c:68:
#                    24:f1:44:b4:6a:88:b3:34:71:74:b7:3c:43:01:b4:
#                    7f:0c:0d:7f:4d:94:64:0b:99:a4:6c:c9:56:3a:b0:
#                    d6:0d:8a:28:32:c5:5f:24:6e:df:92:43:d8:54:7f:
#                    05:9e:69:1b:fc:88:d2:16:3f:56:e8:6e:fd:60:2b:
#                    d2:8b:35:23:a5:de:8e:d0:5c:e4:35:43:9b:e0:44:
#                    a3:8b:49:89:57:fd:c2:0d:ac:68:6d:e5:a3:0e:f2:
#                    b4:15:c1:67:33:eb:d0:49:01:c6:6d:d0:da:1b:a4:
#                    f1:23:b5:d8:66:a0:71:47:6a:21:77:71:bd:5d:6d:
#                    a7:93:86:02:d0:fd:53:65:d1:4b:b5:fd:ba:19:ef:
#                    5b:35
#                Exponent: 65537 (0x10001)
#        Attributes:
#            unstructuredName         :123company
#    Signature Algorithm: sha256WithRSAEncryption
#         3b:86:3a:62:2e:02:27:87:3e:1c:17:19:89:67:c9:66:5b:ad:
#         2a:fa:cb:f7:b5:ba:58:88:dd:01:2a:dc:90:bb:47:74:c8:1d:
#         ff:54:1e:2f:2f:0a:95:df:5a:6f:71:06:12:3e:96:c2:2f:78:
#         01:74:34:74:e5:37:29:27:3f:5a:f8:ae:46:df:a8:24:6d:f1:
#         54:11:ba:6f:13:36:c8:f1:1f:d2:0b:ab:13:19:3c:a3:02:e3:
#         ed:b7:c3:a6:a9:1f:e6:7a:d0:ec:37:07:17:11:07:d0:a4:ff:
#         f0:92:ea:48:4a:11:b4:a6:20:e1:3e:e5:f6:94:12:2a:6e:f4:
#         16:b1:71:ec:3d:5c:01:67:e2:69:36:55:a0:d0:a0:3e:ad:c1:
#         1f:9b:81:d1:96:7c:23:fe:3f:6b:44:23:50:8c:17:91:d0:55:
#         09:ef:43:92:53:5c:d7:f5:0a:54:15:95:fd:94:5d:73:aa:80:
#         3f:08:ef:5c:66:c9:d2:68:76:c4:71:eb:44:4c:c3:ae:b9:e2:
#         9f:c5:7b:fa:37:b1:35:65:45:45:96:e4:dc:b1:47:ce:a4:b4:
#         4a:30:27:d3:bf:23:2e:4e:a0:e7:f0:5b:70:ad:a1:31:12:b9:
#         2d:dd:92:d2:b6:4b:53:d9:48:1c:d5:a6:51:e8:67:7e:58:2c:
#         51:dd:1e:0d





# 用另一个私钥来签署证书请求文件
openssl req -x509 -key private_crt.key -in req_ca_sign.csr -out req_ca_sign.crt -days 365


# 证书生成之后可以查看

openssl  x509 -in req_ca_sign.crt  -text -noout


#Certificate:
#    Data:
#        Version: 3 (0x2)
#        Serial Number:
#            ba:2f:47:19:63:68:f8:8b
#    Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.example.com, emailAddress = 17842379@qq.com
#        Validity
#            Not Before: Apr 19 04:31:04 2018 GMT
#            Not After : Apr 19 04:31:04 2019 GMT
#        Subject: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.example.com, emailAddress = 17842379@qq.com
#        Subject Public Key Info:
#            Public Key Algorithm: rsaEncryption
#                Public-Key: (2048 bit)
#                Modulus:
#                    00:c4:e7:f4:b7:72:44:71:2e:12:c7:44:57:26:f5:
#                    e3:47:8c:44:b7:92:40:28:1b:b9:3f:f6:73:cc:c3:
#                    3f:89:7d:fe:bc:fa:1e:df:9c:10:be:32:8d:28:e1:
#                    1d:23:f9:70:12:b9:e8:92:1c:54:b7:86:7a:6b:8c:
#                    b4:dd:12:ff:58:72:31:7e:9d:cb:5d:0b:f0:ca:dc:
#                    69:4b:5e:d4:76:a0:31:06:8f:a2:79:28:30:d1:8f:
#                    99:e7:83:87:16:54:38:19:78:06:55:03:56:b0:d9:
#                    51:63:6e:84:0d:e6:e6:75:6f:d5:4c:6f:38:5c:68:
#                    24:f1:44:b4:6a:88:b3:34:71:74:b7:3c:43:01:b4:
#                    7f:0c:0d:7f:4d:94:64:0b:99:a4:6c:c9:56:3a:b0:
#                    d6:0d:8a:28:32:c5:5f:24:6e:df:92:43:d8:54:7f:
#                    05:9e:69:1b:fc:88:d2:16:3f:56:e8:6e:fd:60:2b:
#                    d2:8b:35:23:a5:de:8e:d0:5c:e4:35:43:9b:e0:44:
#                    a3:8b:49:89:57:fd:c2:0d:ac:68:6d:e5:a3:0e:f2:
#                    b4:15:c1:67:33:eb:d0:49:01:c6:6d:d0:da:1b:a4:
#                    f1:23:b5:d8:66:a0:71:47:6a:21:77:71:bd:5d:6d:
#                    a7:93:86:02:d0:fd:53:65:d1:4b:b5:fd:ba:19:ef:
#                    5b:35
#                Exponent: 65537 (0x10001)
#        X509v3 extensions:
#            X509v3 Subject Key Identifier: 
#                2A:EB:1A:AD:F4:17:01:F9:56:1F:B3:EB:3E:E0:CF:DE:3B:C2:9D:7B
#            X509v3 Authority Key Identifier: 
#                keyid:2A:EB:1A:AD:F4:17:01:F9:56:1F:B3:EB:3E:E0:CF:DE:3B:C2:9D:7B
#
#            X509v3 Basic Constraints: critical
#                CA:TRUE
#    Signature Algorithm: sha256WithRSAEncryption
#         77:89:b5:10:de:0b:e1:85:d6:c6:b5:8f:30:5f:af:36:fc:07:
#         c9:8f:41:f2:d0:b5:90:33:5e:cd:66:fa:2c:2f:fe:57:bc:23:
#         bd:33:1a:07:72:69:35:2b:1e:40:68:58:dd:48:da:e5:62:ba:
#         22:37:5f:32:07:c0:6e:e0:54:f5:63:32:6b:0c:be:8e:2e:be:
#         92:68:62:3e:d2:3f:6b:c9:ef:b0:fe:7a:d8:cb:83:1b:0c:4a:
#         f5:e9:9a:a3:6a:84:b5:33:c5:c6:80:aa:62:6b:9a:c5:7e:46:
#         81:3c:d5:2e:63:51:3b:8e:82:4d:4d:ca:e5:35:9f:52:4f:17:
#         4a:31:89:d6:c9:6d:49:14:bd:33:79:12:f8:13:4f:08:a5:0e:
#         fb:22:af:c7:31:d7:df:4d:68:e2:4c:94:55:b6:32:a8:47:6d:
#         19:99:b2:32:26:8a:66:06:1a:29:bf:4d:45:f3:4c:e9:3f:89:
#         b8:6e:34:bf:1b:ed:80:92:ce:d1:e1:16:5a:c2:86:46:a2:48:
#         a1:aa:dc:f7:9b:2b:6e:37:cf:c8:54:a4:27:60:58:86:89:80:
#         71:16:6f:80:db:8c:44:d5:15:78:34:f2:04:27:72:61:7b:c6:
#         d1:df:1a:32:8d:42:62:ac:18:eb:bf:6c:da:93:35:c6:98:28:
#         96:9b:95:5e
