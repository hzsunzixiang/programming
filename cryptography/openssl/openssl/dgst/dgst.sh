
## 生成私钥
#openssl genrsa -out privatekey.pem 2048
#
## 导出公钥
#openssl rsa -in privatekey.pem -pubout -out publickey.pem

#或者 两者导出的公钥格式不一样
#ssh-keygen  -y -f  privatekey.pem

openssl dgst -md5 -hex file.txt
#mdc2 md2 
for i in   sha sha1 ripemd160 sha224 sha256 sha384 sha512  md4 md5 dss1 
do 
	openssl dgst -$i -hex file.txt
done

# 登记形式为
for i in   sha sha1 ripemd160 sha224 sha256 sha384 sha512  md4 md5 dss1 
do 
	openssl $i -hex file.txt
done

openssl dgst -sha256 -sign privatekey.pem -out signature.sign file.txt
openssl dgst -sha256 -verify publickey.pem  -signature signature.sign  file.txt
#       To create a hex-encoded message digest of a file:
#        openssl dgst -md5 -hex file.txt
#
#       To sign a file using SHA-256 with binary file output:
#        openssl dgst -sha256 -sign privatekey.pem -out signature.sign file.txt
#
#       To verify a signature:
#        openssl dgst -sha256 -verify publickey.pem \
#        -signature signature.sign \
#        file.txt
