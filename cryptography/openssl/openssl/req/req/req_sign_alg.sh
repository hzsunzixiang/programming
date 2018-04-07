


#指定证书请求文件中的签名算法。
#
#注意到证书请求文件的头部分有一项是"Signature Algorithm"，它表示使用的是哪种数字签名算法。默认使用的是sha1，还支持md5、sha512等，更多可支持的签名算法见"openssl dgst --help"中所列出内容。例如此处指定md5算法。
#-[digest]
#    this specifies the message digest to sign the request.  Any digest supported by the OpenSSL dgst command can be used.  This overrides the digest algorithm
#    specified in the configuration file.
#
#    Some public key algorithms may override this choice. For instance, DSA signatures always use SHA1, GOST R 34.10 signatures always use GOST R 34.11-94
#    (-md_gost94).


# 创建一个新的证书
#openssl req -new  -key pri_key.pem  -out req2.csr -md5

# 查看是md5签名
openssl req -in req2.csr  -text -noout |grep md5
