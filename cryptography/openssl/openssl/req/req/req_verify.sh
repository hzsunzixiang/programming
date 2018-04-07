


#Examine and verify certificate request:
openssl req -in req1.csr -text -verify -noout

# 只显示验证结果
openssl req -in req1.csr -verify -noout


# 证书的验证

# 这个时候只能用  CA的公钥进行验证
# TODO 
# 这样是不行的 没有这样的命令
# openssl  req  -x509 -in CA2.crt  -verify -noout


# https://stackoverflow.com/questions/25482199/verify-a-certificate-chain-using-openssl-verify
# openssl verify -CAfile RootCert.pem -untrusted Intermediate.pem UserCert.pem

