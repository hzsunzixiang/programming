



# 验证签名
# https://linuxctl.com/2017/02/x509-certificate-manual-signature-verification/#what-does-signing-a-certificate-mean


# 这里是来验证 csr文件的签名的
# 则 密钥 private.key  可以提取到公钥 

openssl  rsa -in private.key -pubout  -out public.key

# 我们用 public.key
# Extracting the Signature
# 提取签名信息

openssl req -in req_self_sign.csr  -text -noout 
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


# 从而得到签名 和  签名算法 sha256WithRSAEncryption


# We can take this hex and dump it to disk as a binary like this:
# 把签名 保存为二进制
# extract hex of signature

# 这个不能再用命令 openssl x509 获取了  因为这本身不是一个证书 而是一个csr文件
openssl asn1parse -in req_self_sign.csr

openssl asn1parse -in req_self_sign.csr -out signature_csr.bin -noout -strparse 488 

# 注意这里的签名应该是 对 `der格式存放的二进制` 进行加密之后的字符串
# 所以对这段字符串进行解密之后 得到了der格式的二进制， 用 asn1parse 命令查看


# 可以用命令复查


#Decrypting the Signature (RSA)
# 对签名进行解密 
# 利用已经拿到的公钥和签名，得到原始hash字符串

# -pubin 意思输入时公钥 ，默认是私钥
# 这个输出是二进制
openssl rsautl -verify -inkey public.key -in signature_csr.bin -pubin  -out signature_csr_decrypted.bin


# 这个输出 是 文字形式
# 这个相当于  两步合成一步了 rsautl asn1parse 
# openssl rsautl ... openssl asn1parse ...
#openssl rsautl -verify -inkey public.key -in signature_csr.bin -asn1parse -pubin  -out signature_csr_decrypted.bin

#```
#openssl rsautl -verify -inkey public.key -in signature_csr.bin -asn1parse -pubin
#    0:d=0  hl=2 l=  49 cons: SEQUENCE
#    2:d=1  hl=2 l=  13 cons:  SEQUENCE
#    4:d=2  hl=2 l=   9 prim:   OBJECT            :sha256
#   15:d=2  hl=2 l=   0 prim:   NULL
#   17:d=1  hl=2 l=  32 prim:  OCTET STRING
#      0000 - 7d ec a4 89 37 1f 75 f3-e0 9a ce 7f 94 29 af bc   }...7.u......)..
#      0010 - 24 64 ce e1 85 de 79 0b-d1 21 6c 5f 77 da dc 87   $d....y..!l_w...

#```

# 对这段字符串进行解密之后 得到了der格式的二进制， 用 asn1parse 命令查看
# 这样就拿到了原始的hash字符串 7DECA489371F75F3E09ACE7F9429AFBC2464CEE185DE790BD1216C5F77DADC87 

#openssl asn1parse -inform der -in signature_csr_decrypted.bin
#    0:d=0  hl=2 l=  49 cons: SEQUENCE
#    2:d=1  hl=2 l=  13 cons: SEQUENCE
#    4:d=2  hl=2 l=   9 prim: OBJECT            :sha256
#   15:d=2  hl=2 l=   0 prim: NULL
#   17:d=1  hl=2 l=  32 prim: OCTET STRING      [HEX DUMP]:7DECA489371F75F3E09ACE7F9429AFBC2464CEE185DE790BD1216C5F77DADC87


# 所以可以反推
# 1. 先对hash字符串按der格式存放，包括其他信息
# 2. 然后对der的二进制进行私钥签名，就得到了csr中的签名字符串
====================================================================================================
#以上是根据公钥和证书中的信息拿到了hash字符串
#下面开始以原始数据 构造hash字符串，进而可以对hash字符串签名， 这样hash和签名都能拿到
====================================================================================================


# Hashing the Original Signature
# Hash 原字符串

#Now that we got a hash of the orginal certificate, we need to verify if we can obtain the same hash by using the same hashing function (in this case SHA-384). In order to do that, we need to extract just the body of the signed certificate. Which, in our case, is everything but the signature. The start of the body is always the first digit of the second line of the following command:

# 我们的算法是 hash256
# extract just the body of the signed certificate. Which, in our case, is everything but the signature



openssl asn1parse -i -in  req_self_sign.csr

#    0:d=0  hl=4 l= 745 cons: SEQUENCE          
#    4:d=1  hl=4 l= 465 cons:  SEQUENCE          
#    8:d=2  hl=2 l=   1 prim:   INTEGER           :00
#   11:d=2  hl=3 l= 136 cons:   SEQUENCE          
#   14:d=3  hl=2 l=  11 cons:    SET               
#   16:d=4  hl=2 l=   9 cons:     SEQUENCE          
#   18:d=5  hl=2 l=   3 prim:      OBJECT            :countryName
#   23:d=5  hl=2 l=   2 prim:      PRINTABLESTRING   :CN
#   27:d=3  hl=2 l=  17 cons:    SET               
#   29:d=4  hl=2 l=  15 cons:     SEQUENCE          
#   31:d=5  hl=2 l=   3 prim:      OBJECT            :stateOrProvinceName
#   36:d=5  hl=2 l=   8 prim:      UTF8STRING        :ShenZhen
#   46:d=3  hl=2 l=  17 cons:    SET               
#   48:d=4  hl=2 l=  15 cons:     SEQUENCE          
#   50:d=5  hl=2 l=   3 prim:      OBJECT            :localityName
#   55:d=5  hl=2 l=   8 prim:      UTF8STRING        :ShenZhen
#   65:d=3  hl=2 l=  11 cons:    SET               
#   67:d=4  hl=2 l=   9 cons:     SEQUENCE          
#   69:d=5  hl=2 l=   3 prim:      OBJECT            :organizationName
#   74:d=5  hl=2 l=   2 prim:      UTF8STRING        :TC
#   78:d=3  hl=2 l=  12 cons:    SET               
#   80:d=4  hl=2 l=  10 cons:     SEQUENCE          
#   82:d=5  hl=2 l=   3 prim:      OBJECT            :organizationalUnitName
#   87:d=5  hl=2 l=   3 prim:      UTF8STRING        :CDG
#   92:d=3  hl=2 l=  24 cons:    SET               
#   94:d=4  hl=2 l=  22 cons:     SEQUENCE          
#   96:d=5  hl=2 l=   3 prim:      OBJECT            :commonName
#  101:d=5  hl=2 l=  15 prim:      UTF8STRING        :www.example.com
#  118:d=3  hl=2 l=  30 cons:    SET               
#  120:d=4  hl=2 l=  28 cons:     SEQUENCE          
#  122:d=5  hl=2 l=   9 prim:      OBJECT            :emailAddress
#  133:d=5  hl=2 l=  15 prim:      IA5STRING         :17842379@qq.com
#  150:d=2  hl=4 l= 290 cons:   SEQUENCE          
#  154:d=3  hl=2 l=  13 cons:    SEQUENCE          
#  156:d=4  hl=2 l=   9 prim:     OBJECT            :rsaEncryption
#  167:d=4  hl=2 l=   0 prim:     NULL              
#  169:d=3  hl=4 l= 271 prim:    BIT STRING        
#  444:d=2  hl=2 l=  27 cons:   cont [ 0 ]        
#  446:d=3  hl=2 l=  25 cons:    SEQUENCE          
#  448:d=4  hl=2 l=   9 prim:     OBJECT            :unstructuredName
#  459:d=4  hl=2 l=  12 cons:     SET               
#  461:d=5  hl=2 l=  10 prim:      UTF8STRING        :123company
#  473:d=1  hl=2 l=  13 cons:  SEQUENCE          
#  475:d=2  hl=2 l=   9 prim:   OBJECT            :sha256WithRSAEncryption
#  486:d=2  hl=2 l=   0 prim:   NULL              
#  488:d=1  hl=4 l= 257 prim:  BIT STRING        


#We can extract this data and store it to disk like so:
# 提取数据 存储
# 这里面是csr里面的主体数据
# 从这个思路出发 可以知道 csr是如何签名的

openssl asn1parse -in req_self_sign.csr -strparse 4 -out req_self_sign_body.bin -noout


#Finally, we can run this through the same hashing function to determine the digest

openssl dgst -sha256 req_self_sign_body.bin


#SHA256(req_self_sign_body.bin)= 7deca489371f75f3e09ace7f9429afbc2464cee185de790bd1216c5f77dadc87

#As you can see, both hashes match, so we can now confirm that:

# 可以看出两者是匹配的

#private.key   did sign  req_self_sign.csr
# private.key 这个私钥 确实签名了  req_self_sign.csr




