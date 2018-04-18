



#生成密钥
openssl  genrsa  -out rsa_pri_2048.key 2048
# 导出公钥
openssl rsa -in rsa_pri_2048.key   -pubout  >rsa_pub_2048.pub



# 生成测试文件
# vi test.txt
# 用私钥对文件内容进行签名 输出到 test_sign.txt
openssl  rsautl  -inkey rsa_pri_2048.key -in test.txt  -sign >test_sign.txt 
hexdump  test_sign.txt 

# 验证 默认用私钥文件验证
openssl rsautl -inkey  rsa_pri_2048.key -in test_sign.txt  -verify
# -pubin 指定输出的是公钥文件 
openssl rsautl -inkey  rsa_pub_2048.pub  -in test_sign.txt   -pubin -verify
