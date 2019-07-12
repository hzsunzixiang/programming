
openssl genrsa -out rsa_pri_512.key 512 
openssl rsa -text -in rsa_pri_512.key



#       To just output the public part of a private key:
#
openssl rsa -in rsa_pri_512.key -pubout -out rsa_pub_512.key

ericksun@debian:~/programming/cryptography/openssl/openssl/rsa$ openssl rsa -in key.pem  -pubout -out  fd_key.pub
Enter pass phrase for key.pem:
writing RSA key




# 查看公钥信息的明文  其中有Modulus Exponent(这是公钥)
ericksun@debian:~/programming/cryptography/openssl/openssl/rsa$ openssl  rsa  -in fd_key.pub   -pubin -text
#Public-Key: (2048 bit)
#Modulus:
#    00:d4:12:26:7a:cb:06:ec:80:cd:c1:97:f5:ae:6a:
#    bc:84:09:68:b3:0e:cd:11:63:be:61:69:8f:5a:49:
#    f4:c4:70:05:23:a1:34:e9:e3:8b:2a:d3:73:71:09:
#    14:ec:16:ee:6a:21:2f:d5:eb:4e:77:ff:d7:ab:4d:
#    6f:4d:76:2d:9f:9b:da:6e:25:a9:79:b6:73:55:65:
#    cb:9a:0b:41:02:1c:76:99:78:09:29:ec:73:86:a6:
#    98:36:37:8e:02:41:e9:26:19:31:39:38:4e:13:da:
#    4c:9c:a2:17:d6:d0:55:73:13:84:ce:97:61:81:c1:
#    cc:84:a8:b6:eb:fb:c2:59:52:0c:cc:db:5a:9b:83:
#    d4:29:59:23:c8:63:7b:33:9a:e1:3f:1b:e2:24:e1:
#    d9:61:e4:58:08:b7:a2:a4:f3:5f:8a:40:00:75:1b:
#    5e:d4:d1:12:1e:43:cc:4f:e7:a1:8f:14:eb:8c:76:
#    6d:96:49:f8:46:de:c5:ea:25:95:18:0f:42:00:52:
#    9a:2e:78:85:d1:7e:7c:be:0b:ec:3a:f9:0f:a6:d9:
#    07:8b:0f:d2:2c:3a:65:f2:b9:97:78:07:f7:cf:08:
#    2d:0d:7a:99:ee:e1:56:1c:4d:b7:21:35:02:95:06:
#    22:00:46:cc:50:e8:7e:f1:48:d1:16:cb:d0:85:94:
#    2a:f7
#Exponent: 65537 (0x10001)
#writing RSA key
#-----BEGIN PUBLIC KEY-----
#MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1BImessG7IDNwZf1rmq8
#hAlosw7NEWO+YWmPWkn0xHAFI6E06eOLKtNzcQkU7BbuaiEv1etOd//Xq01vTXYt
#n5vabiWpebZzVWXLmgtBAhx2mXgJKexzhqaYNjeOAkHpJhkxOThOE9pMnKIX1tBV
#cxOEzpdhgcHMhKi26/vCWVIMzNtam4PUKVkjyGN7M5rhPxviJOHZYeRYCLeipPNf
#ikAAdRte1NESHkPMT+ehjxTrjHZtlkn4Rt7F6iWVGA9CAFKaLniF0X58vgvsOvkP
#ptkHiw/SLDpl8rmXeAf3zwgtDXqZ7uFWHE23ITUClQYiAEbMUOh+8UjRFsvQhZQq
#9wIDAQAB
#-----END PUBLIC KEY-----


