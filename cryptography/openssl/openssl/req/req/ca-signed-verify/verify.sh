



# 验证签名
# https://linuxctl.com/2017/02/x509-certificate-manual-signature-verification/#what-does-signing-a-certificate-mean


# 如果是从ca签名的
# 则 从CA 密钥 private_crt.key  
# 跟证书 req_self_sign.crt中提取到公钥是不一样的


#  从CA的私钥中提取公钥 发布出去 这样客户端就能拿到这个公钥
# Obtaining the Issuer’s Public Key

openssl  rsa -in private_crt.key -pubout  -out public_crt.key

# 跟下面这个公钥不一样
#openssl x509  -in req_ca_sign.crt -noout -pubkey -out public_crt1.key

#md5sum public*

# 我们用 public_crt.key
# Extracting the Signature
# 提取签名信息


# The signature (along with algorithm) can be viewed from the signed certificate using openssl

openssl x509 -in req_ca_sign.crt  -noout -text

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


# 从而得到签名 和  签名算法 sha256WithRSAEncryption


# We can take this hex and dump it to disk as a binary like this:
# 把签名 保存为二进制
# extract hex of signature

SIGNATURE_HEX=$(openssl x509 -in req_ca_sign.crt -text -noout -certopt ca_default -certopt no_validity -certopt no_serial -certopt no_subject -certopt no_extensions -certopt no_signame | grep -v 'Signature Algorithm' | tr -d '[:space:]:')

#获取到
#302c962c7987bd7d93a730b75396624928cf3373430e72d74c0edd37d491e8be734711d8f3f5cafec5137c3e90dbb4363ec309bb9eea895aa39d1f1dda7f9f6259b20f793aa9d0240d723c5d060ed7579c39e1d30369dfe5c633cd54eeb94889abe89a27a876dd897d13336483d07316c50dfe4387c2c48eb28ca62e2a3db69afefbb087390da4efd172043617505f2e916101d1474a3455ff6d1e1249d157f64e7472dd6a449c9b59d17129410ff0c0f31b95253f86407b1d1d272cabab35047a4b90da9af10d37e3fb81cf4414bdb2da09471fe422f42f8e0f711a86377c4436d0e97723c9455cfa249476b1664005307b8f8a45b86c943f42ff342f617312

# create signature dump
# 存放签名的二进制
echo ${SIGNATURE_HEX} | xxd -r -p > signature_crt.bin

# 注意这里的签名应该是 对 `der格式存放的二进制` 进行加密之后的字符串
# 所以对这段字符串进行解密之后 得到了der格式的二进制， 用 asn1parse 命令查看


# 可以用命令复查
#xxd signature_crt.bin
#hexdump -C signature_crt.bin


#Decrypting the Signature (RSA)
# 对签名进行解密 
# 利用已经拿到的公钥和签名，得到原始hash字符串

# -pubin 意思输入时公钥 ，默认是私钥
# 这个输出是二进制  找到这个二进制还有另一种方式 参看verify_1.sh
openssl rsautl -verify -inkey public_crt.key -in signature_crt.bin -pubin  -out signature_crt_decrypted.bin


# 这个输出 是 文字形式
# 这个相当于  两步合成一步了 rsautl asn1parse 
# openssl rsautl ... openssl asn1parse ...
#```
#openssl rsautl -verify -inkey public_crt.key -in signature_crt.bin -asn1parse -pubin
#    0:d=0  hl=2 l=  49 cons: SEQUENCE          
#    2:d=1  hl=2 l=  13 cons:  SEQUENCE          
#    4:d=2  hl=2 l=   9 prim:   OBJECT            :sha256
#   15:d=2  hl=2 l=   0 prim:   NULL              
#   17:d=1  hl=2 l=  32 prim:  OCTET STRING      
#      0000 - 1d b9 c0 af 90 95 66 4f-49 f6 68 f9 81 56 20 e1   ......fOI.h..V .
#      0010 - 82 f7 fe 90 53 b9 0c 30-0f 39 c1 1c 4c ff 53 99   ....S..0.9..L.S.
#```

# 对这段字符串进行解密之后 得到了der格式的二进制， 用 asn1parse 命令查看
# 这样就拿到了原始的hash字符串  1DB9C0AF9095664F49F668F9815620E182F7FE9053B90C300F39C11C4CFF5399

openssl asn1parse -inform der -in signature_crt_decrypted.bin

#    0:d=0  hl=2 l=  49 cons: SEQUENCE          
#    2:d=1  hl=2 l=  13 cons: SEQUENCE          
#    4:d=2  hl=2 l=   9 prim: OBJECT            :sha256
#   15:d=2  hl=2 l=   0 prim: NULL              
#   17:d=1  hl=2 l=  32 prim: OCTET STRING      [HEX DUMP]:1DB9C0AF9095664F49F668F9815620E182F7FE9053B90C300F39C11C4CFF5399

# 所以可以反推
# 1. 先对hash字符串按der格式存放，包括其他信息
# 2. 然后对der的二进制进行私钥签名，就得到了crt中的签名字符串
====================================================================================================
#以上是根据公钥和证书中的信息拿到了hash字符串
#下面开始以原始数据 构造hash字符串，进而可以对hash字符串签名， 这样hash和签名都能拿到
====================================================================================================


# Hashing the Original Signature
# Hash 原字符串

#Now that we got a hash of the orginal certificate, we need to verify if we can obtain the same hash by using the same hashing function (in this case SHA-384). In order to do that, we need to extract just the body of the signed certificate. Which, in our case, is everything but the signature. The start of the body is always the first digit of the second line of the following command:

# 我们的算法是 hash256
# extract just the body of the signed certificate. Which, in our case, is everything but the signature



openssl asn1parse -i -in  req_ca_sign.crt
#
#    0:d=0  hl=4 l=1000 cons: SEQUENCE          
#    4:d=1  hl=4 l= 720 cons:  SEQUENCE          
#    8:d=2  hl=2 l=   3 cons:   cont [ 0 ]        
#   10:d=3  hl=2 l=   1 prim:    INTEGER           :02
#   13:d=2  hl=2 l=   9 prim:   INTEGER           :BA2F47196368F88B
#   24:d=2  hl=2 l=  13 cons:   SEQUENCE          
#   26:d=3  hl=2 l=   9 prim:    OBJECT            :sha256WithRSAEncryption
#   37:d=3  hl=2 l=   0 prim:    NULL              
#   39:d=2  hl=3 l= 136 cons:   SEQUENCE          
#   42:d=3  hl=2 l=  11 cons:    SET               
#   44:d=4  hl=2 l=   9 cons:     SEQUENCE          
#   46:d=5  hl=2 l=   3 prim:      OBJECT            :countryName
#   51:d=5  hl=2 l=   2 prim:      PRINTABLESTRING   :CN
#   55:d=3  hl=2 l=  17 cons:    SET               
#   57:d=4  hl=2 l=  15 cons:     SEQUENCE          
#   59:d=5  hl=2 l=   3 prim:      OBJECT            :stateOrProvinceName
#   64:d=5  hl=2 l=   8 prim:      UTF8STRING        :ShenZhen
#   74:d=3  hl=2 l=  17 cons:    SET               
#   76:d=4  hl=2 l=  15 cons:     SEQUENCE          
#   78:d=5  hl=2 l=   3 prim:      OBJECT            :localityName
#   83:d=5  hl=2 l=   8 prim:      UTF8STRING        :ShenZhen
#   93:d=3  hl=2 l=  11 cons:    SET               
#   95:d=4  hl=2 l=   9 cons:     SEQUENCE          
#   97:d=5  hl=2 l=   3 prim:      OBJECT            :organizationName
#  102:d=5  hl=2 l=   2 prim:      UTF8STRING        :TC
#  106:d=3  hl=2 l=  12 cons:    SET               
#  108:d=4  hl=2 l=  10 cons:     SEQUENCE          
#  110:d=5  hl=2 l=   3 prim:      OBJECT            :organizationalUnitName
#  115:d=5  hl=2 l=   3 prim:      UTF8STRING        :CDG
#  120:d=3  hl=2 l=  24 cons:    SET               
#  122:d=4  hl=2 l=  22 cons:     SEQUENCE          
#  124:d=5  hl=2 l=   3 prim:      OBJECT            :commonName
#  129:d=5  hl=2 l=  15 prim:      UTF8STRING        :www.example.com
#  146:d=3  hl=2 l=  30 cons:    SET               
#  148:d=4  hl=2 l=  28 cons:     SEQUENCE          
#  150:d=5  hl=2 l=   9 prim:      OBJECT            :emailAddress
#  161:d=5  hl=2 l=  15 prim:      IA5STRING         :17842379@qq.com
#  178:d=2  hl=2 l=  30 cons:   SEQUENCE          
#  180:d=3  hl=2 l=  13 prim:    UTCTIME           :180419043104Z
#  195:d=3  hl=2 l=  13 prim:    UTCTIME           :190419043104Z
#  210:d=2  hl=3 l= 136 cons:   SEQUENCE          
#  213:d=3  hl=2 l=  11 cons:    SET               
#  215:d=4  hl=2 l=   9 cons:     SEQUENCE          
#  217:d=5  hl=2 l=   3 prim:      OBJECT            :countryName
#  222:d=5  hl=2 l=   2 prim:      PRINTABLESTRING   :CN
#  226:d=3  hl=2 l=  17 cons:    SET               
#  228:d=4  hl=2 l=  15 cons:     SEQUENCE          
#  230:d=5  hl=2 l=   3 prim:      OBJECT            :stateOrProvinceName
#  235:d=5  hl=2 l=   8 prim:      UTF8STRING        :ShenZhen
#  245:d=3  hl=2 l=  17 cons:    SET               
#  247:d=4  hl=2 l=  15 cons:     SEQUENCE          
#  249:d=5  hl=2 l=   3 prim:      OBJECT            :localityName
#  254:d=5  hl=2 l=   8 prim:      UTF8STRING        :ShenZhen
#  264:d=3  hl=2 l=  11 cons:    SET               
#  266:d=4  hl=2 l=   9 cons:     SEQUENCE          
#  268:d=5  hl=2 l=   3 prim:      OBJECT            :organizationName
#  273:d=5  hl=2 l=   2 prim:      UTF8STRING        :TC
#  277:d=3  hl=2 l=  12 cons:    SET               
#  279:d=4  hl=2 l=  10 cons:     SEQUENCE          
#  281:d=5  hl=2 l=   3 prim:      OBJECT            :organizationalUnitName
#  286:d=5  hl=2 l=   3 prim:      UTF8STRING        :CDG
#  291:d=3  hl=2 l=  24 cons:    SET               
#  293:d=4  hl=2 l=  22 cons:     SEQUENCE          
#  295:d=5  hl=2 l=   3 prim:      OBJECT            :commonName
#  300:d=5  hl=2 l=  15 prim:      UTF8STRING        :www.example.com
#  317:d=3  hl=2 l=  30 cons:    SET               
#  319:d=4  hl=2 l=  28 cons:     SEQUENCE          
#  321:d=5  hl=2 l=   9 prim:      OBJECT            :emailAddress
#  332:d=5  hl=2 l=  15 prim:      IA5STRING         :17842379@qq.com
#  349:d=2  hl=4 l= 290 cons:   SEQUENCE          
#  353:d=3  hl=2 l=  13 cons:    SEQUENCE          
#  355:d=4  hl=2 l=   9 prim:     OBJECT            :rsaEncryption
#  366:d=4  hl=2 l=   0 prim:     NULL              
#  368:d=3  hl=4 l= 271 prim:    BIT STRING        
#  643:d=2  hl=2 l=  83 cons:   cont [ 3 ]        
#  645:d=3  hl=2 l=  81 cons:    SEQUENCE          
#  647:d=4  hl=2 l=  29 cons:     SEQUENCE          
#  649:d=5  hl=2 l=   3 prim:      OBJECT            :X509v3 Subject Key Identifier
#  654:d=5  hl=2 l=  22 prim:      OCTET STRING      [HEX DUMP]:04142AEB1AADF41701F9561FB3EB3EE0CFDE3BC29D7B
#  678:d=4  hl=2 l=  31 cons:     SEQUENCE          
#  680:d=5  hl=2 l=   3 prim:      OBJECT            :X509v3 Authority Key Identifier
#  685:d=5  hl=2 l=  24 prim:      OCTET STRING      [HEX DUMP]:301680142AEB1AADF41701F9561FB3EB3EE0CFDE3BC29D7B
#  711:d=4  hl=2 l=  15 cons:     SEQUENCE          
#  713:d=5  hl=2 l=   3 prim:      OBJECT            :X509v3 Basic Constraints
#  718:d=5  hl=2 l=   1 prim:      BOOLEAN           :255
#  721:d=5  hl=2 l=   5 prim:      OCTET STRING      [HEX DUMP]:30030101FF
#  728:d=1  hl=2 l=  13 cons:  SEQUENCE          
#  730:d=2  hl=2 l=   9 prim:   OBJECT            :sha256WithRSAEncryption
#  741:d=2  hl=2 l=   0 prim:   NULL              
#  743:d=1  hl=4 l= 257 prim:  BIT STRING        



#We can extract this data and store it to disk like so:
# 提取数据 存储
# 这里面是crt里面的主题数据
# 从这个思路出发 可以知道 crt是如何签名的
#  man rsautl:      The actual part of the certificate that was signed can be extracted with:

openssl asn1parse -in req_ca_sign.crt -strparse 4 -out req_ca_sign_body.bin -noout


#Finally, we can run this through the same hashing function to determine the digest

openssl dgst -sha256 req_ca_sign_body.bin


#SHA256(req_ca_sign_body.bin)= 1db9c0af9095664f49f668f9815620e182f7fe9053b90c300f39c11c4cff5399

#As you can see, both hashes match, so we can now confirm that:

# 可以看出两者是匹配的

#private_crt.key   did sign  req_ca_sign.crt
# private_crt.key 这个私钥 确实签名了  req_ca_sign.crt





