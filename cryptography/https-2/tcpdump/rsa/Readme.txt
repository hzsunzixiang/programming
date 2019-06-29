


1. 使用  dss或者ecc 
  使用如下配置会失败
          SSLProtocol -all +TLSv1
		  # only rsa , this also ok
		  SSLCipherSuite ALL:!EXP:!NULL:!DH:!ECDH


curl_SSL23_dss.failure.pcapng

SSLCertificateFile /home/ericksun/programming/cryptography/https-2/cert_dss/mycert.crt
SSLCertificateKeyFile  /home/ericksun/programming/cryptography/https-2/cert_dss/ericksun_priv_key.key


2. 秘钥使用RSA 则会成功

curl_rsa.pcapng

SSLCertificateFile  /etc/ssl/certs/ssl-cert-snakeoil.pem
SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key

