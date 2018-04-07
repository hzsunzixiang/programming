自签署证书，可用于自建根CA时。

使用openssl req自签署证书时，需要使用"-x509"选项，由于是签署证书请求文件，所以可以指定"-days"指定所颁发的证书有效期。

[root@xuexi tmp]# openssl req -x509 -key pri_key.pem -in req1.csr -out CA1.crt -days 365
