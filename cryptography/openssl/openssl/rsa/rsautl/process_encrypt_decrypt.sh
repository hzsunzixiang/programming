



##生成密钥
#openssl  genrsa  -out rsa_pri_2048.key 2048
## 导出公钥
#openssl rsa -in rsa_pri_2048.key   -pubout  >rsa_pub_2048.pub


# 生成测试文件
# vi example.txt
#       -encrypt
#           encrypt the input data using an RSA public key.
#
#       -decrypt
#           decrypt the input data using an RSA private key.
## 用公钥对文件内容进行加密 输出到 example_sign.bin
## 默认指定私钥文件 -pubin 指定输出的是公钥文件 
openssl rsautl  -inkey rsa_pub_2048.pub -pubin  -in example.txt  -encrypt >example_encrypt.bin 
#
## 解密 默认用私钥文件解密
#openssl rsautl -inkey  rsa_pri_2048.key -in test_sign.txt  -verify
#openssl rsautl -inkey  rsa_pub_2048.pub  -in test_sign.txt   -pubin -verify
openssl rsautl -inkey  rsa_pri_2048.key -decrypt  -in example_encrypt.bin  >example_decrypt.txt

md5sum example*.txt
