


第一步就是先创建出私钥pri_key.pem。其实私钥文件是非必需的，因为openssl req在需要它的时候会自动创建在特定的路径下，此处为了举例说明，所以创建它。

openssl genrsa -out pri_key.pem


# -key filename
#           This specifies the file to read the private key from. It also accepts PKCS#8 format private keys for PEM format files.

# -new
#           this option generates a new certificate request. It will prompt the user for the relevant field values. The actual fields prompted for and their maximum and
#           minimum sizes are specified in the configuration file and any requested extensions.

#申请者需要将自己的信息及其公钥放入证书请求中。但在实际操作过程中，所需要提供的是私钥而非公钥，因为它会自动从私钥中提取公钥。另外，还需要将提供的数据进行数字签名(使用单向加密)，保证该证书请求文件的完整性和一致性，防止他人盗取后进行篡改， 

# 所以这个证书请求文件中有用户的公钥信息   但不会有私钥信息
# -text
#    prints out the certificate request in text form.

openssl req -new -key pri_key.pem -out req1.csr


#可以使用openssl req命令查看。其中"-in"选项指定的是证书请求文件。

#-in filename
#This specifies the input filename to read a request from or standard input if this option is not specified. A request is only read if the creation options (-new and -newkey) are not specified.
openssl req -in req1.csr

# 可以查看  具体信息 包括 Subject, Public Key,
openssl  req -text -in req1.csr 

# 其中   Signature Algorithm: sha256WithRSAEncryption 部分为签名
# 把Data部分用私钥签名 

#Certificate Request:
#    Data:
#        Version: 1 (0x0)
#        Subject: C = CN, ST = ShenZhen, L = Shen, O = TC, OU = CDG, CN = www.test.com, emailAddress = haichengsun123@163.com
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
#    Signature Algorithm: sha256WithRSAEncryption
#         90:75:1e:75:9e:95:8b:73:7c:f0:ee:62:18:66:e6:d3:25:ea:
#         35:ab:d2:5f:dc:84:5b:74:6c:bb:9f:b9:0c:64:37:d8:3d:c9:
#         d8:ee:70:bc:b4:8d:65:11:e0:4f:3d:d6:4b:df:39:bf:f1:dd:
#         3b:3f:70:75:d4:5d:26:05:f2:56:33:86:72:02:21:00:01:d3:
#         35:d8:2f:55:9f:fa:db:96:93:ed:97:f4:ea:da:fb:e9:06:5d:
#         e8:73:35:94:99:b7:b3:11:5c:76:2d:b7:56:59:ea:85:11:e5:
#         b0:a3:07:88:5f:ec:bc:fd:51:cb:4a:f4:e9:2c:e8:c0:d9:ae:
#         21:b9:49:24:9d:20:a6:28:b7:c4:fb:11:a5:f0:63:ab:7f:2b:
#         f3:6c:3c:2b:79:e1:5d:1a:f7:6c:9b:44:d8:08:6b:e4:b4:62:
#         c8:38:6a:78:01:8a:77:14:7b:fa:33:4d:f9:d6:c9:ae:1a:41:
#         2f:27:27:e4:04:44:c1:e3:75:9a:84:fd:cd:06:b3:93:48:c3:
#         0b:43:e8:97:79:16:f9:2a:36:3f:bf:42:32:f5:19:fd:01:d6:
#         9f:71:17:1f:e6:4c:bd:50:1b:ed:c5:a0:cf:5c:e5:52:7f:e5:
#         a2:26:b5:83:c5:63:01:e3:e9:a4:f8:34:10:bd:e9:a2:4e:ff:
#         16:a7:06:56
#-----BEGIN CERTIFICATE REQUEST-----
#MIIC4TCCAckCAQAwgYgxCzAJBgNVBAYTAkNOMREwDwYDVQQIDAhTaGVuWmhlbjEN
#MAsGA1UEBwwEU2hlbjELMAkGA1UECgwCVEMxDDAKBgNVBAsMA0NERzEVMBMGA1UE
#AwwMd3d3LnRlc3QuY29tMSUwIwYJKoZIhvcNAQkBFhZoYWljaGVuZ3N1bjEyM0Ax
#NjMuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2DLMtXbuvibO
#RHqnKUfqKiIN2dlq3dZkTnMI2ns3IG71iU74YuHfaFsWBTIqb/s2XiI/jxibSBxz
#yYUrKMOWmrGn6+8Q3hI5z2fkEOY1RO1k49eQKXnWCGKzomI5wrYFS1Ps+jKcSg/A
#4Ej1hcfSXQnpCt5IzaeixPC8U5idpZnTlUh5ox5nNJa4e09Uoj8ebLQZHpFnXsrY
#KeGwV98lEZs4MTbE1bycdG4m2vnUjTcIFif+zVR3nnSDZc+1JtCbtkoBfEva1Wj+
#N5BTxzM7EvvqCsowHrD8Z9qpVzwVWeUGIkIbWWJAxTBIkZaG3WQPoqzZXucikrut
#ivdOnSid9QIDAQABoBMwEQYJKoZIhvcNAQkCMQQMAlRDMA0GCSqGSIb3DQEBCwUA
#A4IBAQCQdR51npWLc3zw7mIYZubTJeo1q9Jf3IRbdGy7n7kMZDfYPcnY7nC8tI1l
#EeBPPdZL3zm/8d07P3B11F0mBfJWM4ZyAiEAAdM12C9Vn/rblpPtl/Tq2vvpBl3o
#czWUmbezEVx2LbdWWeqFEeWwoweIX+y8/VHLSvTpLOjA2a4huUkknSCmKLfE+xGl
#8GOrfyvzbDwreeFdGvdsm0TYCGvktGLIOGp4AYp3FHv6M0351smuGkEvJyfkBETB
#43WahP3NBrOTSMMLQ+iXeRb5KjY/v0Iy9Rn9AdafcRcf5ky9UBvtxaDPXOVSf+Wi
#JrWDxWMB4+mk+DQQvemiTv8WpwZW
#-----END CERTIFICATE REQUEST-----




# 验证
#       -verify
#           verifies the signature on the request.
# 注意 这里是用csr内含的公钥进行验证, 因为是用私钥进行签名的
# 也就是验证的时候不用私钥
# 如果有人把csr文件的信息篡改掉  则验证不会通过
openssl req -verify -in req2.csr


# req1_error 是个错误的文件
openssl  req -in req1_error.csr  -tex
# 情况1: 无法解密: unable to load X509 request
# 情况2：信息验证错误






