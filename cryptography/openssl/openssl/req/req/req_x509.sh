#自签署证书，可用于自建根CA时。

#使用openssl req自签署证书时，需要使用"-x509"选项，由于是签署证书请求文件，所以可以指定"-days"指定所颁发的证书有效期。



# 注意问题来了  这里的pri_key.pem 不一定非得是前面生成csr的密钥
#
#openssl req -x509 -key pri_key.pem -in req1.csr -out CA1.crt -days 365

# 故意把密钥分开

# 再生成一个密钥
openssl genrsa -out pri_key_crt.pem

#-x509
#    this option outputs a self signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self signed root
#    CA. The extensions added to the certificate (if any) are specified in the configuration file. Unless specified using the set_serial option, a large random
#    number will be used for the serial number.
#
#    If existing request is specified with the -in option, it is converted to the self signed certificate otherwise new request is created.
#
#-days n
#    when the -x509 option is being used this specifies the number of days to certify the certificate for. The default is 30 days.
# 用这个密钥来签署证书请求文件
openssl req -x509 -key pri_key_crt.pem -in req1.csr -out CA1.crt -days 365

# 查看
#-in filename
#    This specifies the input filename to read a certificate from or standard input if this option is not specified.
openssl x509  -in CA1.crt

openssl x509  -in CA1.crt -text

#Certificate:
#    Data:
#        Version: 3 (0x2)
#        Serial Number:
#            fb:81:53:1b:c0:2b:1d:b4
#    Signature Algorithm: sha256WithRSAEncryption
#        Issuer: C = CN, ST = ShenZhen, L = Shen, O = TC, OU = CDG, CN = www.test.com, emailAddress = haichengsun123@163.com
#        Validity
#            Not Before: Apr  7 23:22:32 2018 GMT
#            Not After : Apr  7 23:22:32 2019 GMT
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
#        X509v3 extensions:
#            X509v3 Subject Key Identifier: 
#                5F:1B:77:29:61:88:69:06:FB:B0:38:30:88:DE:0B:7F:66:BC:51:29
#            X509v3 Authority Key Identifier: 
#                keyid:5F:1B:77:29:61:88:69:06:FB:B0:38:30:88:DE:0B:7F:66:BC:51:29
#
#            X509v3 Basic Constraints: critical
#                CA:TRUE
#    Signature Algorithm: sha256WithRSAEncryption
#         30:bb:18:cd:9c:b0:10:ba:63:7b:f7:7d:e9:0a:16:42:74:96:
#         1c:e3:e2:99:60:cf:78:a4:9c:0b:18:88:d7:e8:83:a8:44:42:
#         b8:11:cf:d8:f3:6b:20:29:0e:cc:21:df:cd:f3:c6:57:c4:b5:
#         e9:b3:dd:2d:c2:4f:cc:30:52:22:02:1b:bf:a3:ca:fc:a7:3f:
#         01:20:8d:9d:e1:7c:7e:f7:68:0c:db:ba:d2:06:1a:49:d7:8c:
#         31:1b:86:29:0b:25:9b:70:0e:2e:4c:02:be:89:83:a8:aa:f1:
#         ef:27:d3:fe:5b:0e:75:55:95:34:f2:08:d7:5d:65:59:25:b9:
#         6d:fe:9b:b5:ef:79:bd:f1:26:23:8f:43:8a:49:48:68:cf:4a:
#         f7:7a:ca:8b:26:94:7b:1b:fb:37:44:b5:76:5c:89:82:2a:9d:
#         ba:fb:6f:1a:74:43:11:1a:87:09:51:72:bb:18:1c:57:fb:60:
#         3a:60:b0:c5:f3:d8:33:f1:c2:d3:9b:c7:bd:52:12:f4:74:7f:
#         4e:c5:91:38:39:e5:0d:eb:5d:25:b3:8a:5e:ec:9e:4b:9c:e4:
#         d0:aa:ac:eb:7d:aa:50:cc:22:8d:c7:7b:9a:e0:c4:c1:55:6e:
#         f8:f8:3d:9a:b5:af:f1:d5:02:21:00:76:09:63:96:16:10:78:
#         6b:eb:49:73
#-----BEGIN CERTIFICATE-----
#MIID6DCCAtCgAwIBAgIJAPuBUxvAKx20MA0GCSqGSIb3DQEBCwUAMIGIMQswCQYD
#VQQGEwJDTjERMA8GA1UECAwIU2hlblpoZW4xDTALBgNVBAcMBFNoZW4xCzAJBgNV
#BAoMAlRDMQwwCgYDVQQLDANDREcxFTATBgNVBAMMDHd3dy50ZXN0LmNvbTElMCMG
#CSqGSIb3DQEJARYWaGFpY2hlbmdzdW4xMjNAMTYzLmNvbTAeFw0xODA0MDcyMzIy
#MzJaFw0xOTA0MDcyMzIyMzJaMIGIMQswCQYDVQQGEwJDTjERMA8GA1UECAwIU2hl
#blpoZW4xDTALBgNVBAcMBFNoZW4xCzAJBgNVBAoMAlRDMQwwCgYDVQQLDANDREcx
#FTATBgNVBAMMDHd3dy50ZXN0LmNvbTElMCMGCSqGSIb3DQEJARYWaGFpY2hlbmdz
#dW4xMjNAMTYzLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANgy
#zLV27r4mzkR6pylH6ioiDdnZat3WZE5zCNp7NyBu9YlO+GLh32hbFgUyKm/7Nl4i
#P48Ym0gcc8mFKyjDlpqxp+vvEN4SOc9n5BDmNUTtZOPXkCl51ghis6JiOcK2BUtT
#7PoynEoPwOBI9YXH0l0J6QreSM2nosTwvFOYnaWZ05VIeaMeZzSWuHtPVKI/Hmy0
#GR6RZ17K2CnhsFffJRGbODE2xNW8nHRuJtr51I03CBYn/s1Ud550g2XPtSbQm7ZK
#AXxL2tVo/jeQU8czOxL76grKMB6w/GfaqVc8FVnlBiJCG1liQMUwSJGWht1kD6Ks
#2V7nIpK7rYr3Tp0onfUCAwEAAaNTMFEwHQYDVR0OBBYEFF8bdylhiGkG+7A4MIje
#C39mvFEpMB8GA1UdIwQYMBaAFF8bdylhiGkG+7A4MIjeC39mvFEpMA8GA1UdEwEB
#/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBADC7GM2csBC6Y3v3fekKFkJ0lhzj
#4plgz3iknAsYiNfog6hEQrgRz9jzayApDswh383zxlfEtemz3S3CT8wwUiICG7+j
#yvynPwEgjZ3hfH73aAzbutIGGknXjDEbhikLJZtwDi5MAr6Jg6iq8e8n0/5bDnVV
#lTTyCNddZVkluW3+m7Xveb3xJiOPQ4pJSGjPSvd6yosmlHsb+zdEtXZciYIqnbr7
#bxp0QxEahwlRcrsYHFf7YDpgsMXz2DPxwtObx71SEvR0f07FkTg55Q3rXSWzil7s
#nkuc5NCqrOt9qlDMIo3He5rgxMFVbvj4PZq1r/HVAiEAdgljlhYQeGvrSXM=
#-----END CERTIFICATE-----
