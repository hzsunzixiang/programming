


# 思考 是否也可以验证csr文件的  方式

# 这个申请一次就可以了
# 先申请私钥
# openssl genrsa -out private.key 2048


# 然后生成csr文件

# 这个证书请求文件中有用户的公钥信息   但不会有私钥信息

openssl req -new -key private.key -out req_self_sign.csr

# 可以查看各种信息
openssl  req -in req_self_sign.csr  -text -noout

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





# 用同样的这个密钥来签署证书请求文件
openssl req -x509 -key private.key-in req_self_sign.csr -out req_self_sign.crt -days 365


# 证书生成之后可以查看

openssl  x509 -in req_self_sign.crt  -text -noout

#Certificate:
#    Data:
#        Version: 3 (0x2)
#        Serial Number:
#            b6:d8:3b:b3:86:3f:24:fd
#    Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C = CN, ST = ShenZhen, L = ShenZhen, O = TC, OU = CDG, CN = www.example.com, emailAddress = 17842379@qq.com
#        Validity
#            Not Before: Apr 18 22:31:24 2018 GMT
#            Not After : Apr 18 22:31:24 2019 GMT
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
#         30:2c:96:2c:79:87:bd:7d:93:a7:30:b7:53:96:62:49:28:cf:
#         33:73:43:0e:72:d7:4c:0e:dd:37:d4:91:e8:be:73:47:11:d8:
#         f3:f5:ca:fe:c5:13:7c:3e:90:db:b4:36:3e:c3:09:bb:9e:ea:
#         89:5a:a3:9d:1f:1d:da:7f:9f:62:59:b2:0f:79:3a:a9:d0:24:
#         0d:72:3c:5d:06:0e:d7:57:9c:39:e1:d3:03:69:df:e5:c6:33:
#         cd:54:ee:b9:48:89:ab:e8:9a:27:a8:76:dd:89:7d:13:33:64:
#         83:d0:73:16:c5:0d:fe:43:87:c2:c4:8e:b2:8c:a6:2e:2a:3d:
#         b6:9a:fe:fb:b0:87:39:0d:a4:ef:d1:72:04:36:17:50:5f:2e:
#         91:61:01:d1:47:4a:34:55:ff:6d:1e:12:49:d1:57:f6:4e:74:
#         72:dd:6a:44:9c:9b:59:d1:71:29:41:0f:f0:c0:f3:1b:95:25:
#         3f:86:40:7b:1d:1d:27:2c:ab:ab:35:04:7a:4b:90:da:9a:f1:
#         0d:37:e3:fb:81:cf:44:14:bd:b2:da:09:47:1f:e4:22:f4:2f:
#         8e:0f:71:1a:86:37:7c:44:36:d0:e9:77:23:c9:45:5c:fa:24:
#         94:76:b1:66:40:05:30:7b:8f:8a:45:b8:6c:94:3f:42:ff:34:
#         2f:61:73:12
