openssl ecparam -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1

openssl ecparam -genkey  -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1

openssl ecparam -genkey  -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1 |openssl ec -text

# 单纯的生成密钥
openssl ecparam -name prime256v1 -genkey -noout -out key.pem

ecc密约无法指定长度 跟rsa不太一样



# Alice generates her private key
openssl ecparam -name secp256k1 -genkey -noout -out alice_priv_key.pem


# Alice extracts her public key from her private key
openssl ec -in alice_priv_key.pem -pubout -out alice_pub_key.pem



openssl ecparam -name secp384r1 -genkey -noout -out ericksun_priv_key.key

可见格式有所不同
ericksun@debian9-1:~/programming/cryptography/https-2/cert$ openssl ec -in ericksun_priv_key.key  -pubout
read EC key
writing EC key
-----BEGIN PUBLIC KEY-----
MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAETRt2+E77inbthvk8Ipkg+35oBRtlFnlJ
ACOdQhaHElkpfbATtCmOrLWpCA0qyjrGXoA5mmU3Sn59yDF0AZU8icuyVCiShE6p
6YcdPuSV6XQgLkSusprq41CzKnKqGlzt
-----END PUBLIC KEY-----
ericksun@debian9-1:~/programming/cryptography/https-2/cert$ ssh-keygen -y -f ericksun_priv_key.key
ecdsa-sha2-nistp384 AAAAE2VjZHNhLXNoYTItbmlzdHAzODQAAAAIbmlzdHAzODQAAABhBE0bdvhO+4p27Yb5PCKZIPt+aAUbZRZ5SQAjnUIWhxJZKX2wE7Qpjqy1qQgNKso6xl6AOZplN0p+fcgxdAGVPInLslQokoROqemHHT7klel0IC5ErrKa6uNQsypyqhpc7Q==












