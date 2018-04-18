

#https://linuxctl.com/2017/02/x509-certificate-manual-signature-verification/#what-does-signing-a-certificate-mean
#We can decrypt the signature like so:

# 用rsa算法先加密再解密

# 用私钥加密
# 用公钥解密

# 导出公钥
# openssl x509 -in /tmp/rsa-4096-x509.pem -noout -pubkey > /tmp/issuer-pub.pem

# 先生成密钥

# 然后用私钥签名 -sign 
# 然后公钥验证解密 -verify

#openssl rsautl -verify -inkey /tmp/issuer-pub.pem -in /tmp/cert-sig.bin -pubin > /tmp/cert-sig-decrypted.bin



# 用公钥加密 -encrypt

# 用私钥解密 -decrypt 

# 下面这两个配对
        #-sign
        #    sign the input data and output the signed result. This requires an RSA private key.

        #-verify
        #   verify the input data and output the recovered data.
# 下面这两个配对
       #-encrypt
       #    encrypt the input data using an RSA public key.

       #-decrypt
       #    decrypt the input data using an RSA private key.
