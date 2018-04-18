#openssl ecparam -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name secp112r1
#openssl ecparam -name secp192k1 -genkey -out sony.key
#openssl req -new -x509 -nodes -days 365 -key sony.key -out sony.crt
#echo -n foo | ./openssl smime -sign -signer sony.crt -inkey sony.key -noattr -out foo.sig
#echo -n foo | openssl smime -sign -signer sony.crt -inkey sony.key -noattr -out foo.sig
#openssl smime -pk7out -in foo.sig -out foo.pk7
openssl genrsa -aes128 -out fd.key 2048
openssl rsa -text -in fd.key  >rsa_alg.txt

#-check
#    this option checks the consistency of an RSA private key.
openssl rsa -in fd.key -check



#加密私钥文件，加密的密码需要输出 或者  -passout pass:123456 指定


openssl genrsa -out genrsa.txt -aes128 -passout pass:123456 512
openssl rsa -text -in genrsa.txt  -passin pass:123456


# 一条命令
openssl genrsa -aes128 -passout pass:123456 512 | openssl rsa -text -passin pass:123456


# 去除密码
openssl  rsa -in genrsa.txt -out genrsa_nopasswd.txt


# 两种命令导出的格式不一样  还没高清楚
#  导出公钥
#ericksun@debian:~/programming/cryptography/openssl/openssl/rsa$ ssh-keygen  -y -f fd.key
#Enter passphrase:
#ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC81XfHlCsDetpsJlAUWXkTLmkjUo10xuRMLrEzjSNrWnS8Rt6jVlhT98bRWayle9RM9lEceCn8TstuWRKjISN2rbzUEpEifz7VRcJWklhi80xm91/BOuLnFm/G7jjZQzAWoWWdZVxyyJk6tI8lc+AMiyFsdfHpwfvE1+dSHm5P93P/cUfuPSQKc8Hdb5Si4J7FCLLF/W99FEnleA91I1qnY7AG4tdwT2RtD0dfRtPw79VjxNQ7vnC1xUscTzshUUtlOHNcefgcXVdl8fI3U1qqDvG1jDQ2YbQL1aLDGd3V0vXxVYtGDTa3mETf6A0z8fC37Mf0amDcS92HFPRv3mrL
#

#       To just output the public part of a private key:
#
openssl rsa -in fd.key -pubout -out pubkey.pem

#       To remove the pass phrase on an RSA private key:
#
#        openssl rsa -in key.pem -out keyout.pem
#
#       To encrypt a private key using triple DES:
#
#        openssl rsa -in key.pem -des3 -out keyout.pem
#
#       To convert a private key from PEM to DER format:
#
#        openssl rsa -in key.pem -outform DER -out keyout.der
#
#       To print out the components of a private key to standard output:
#
#        openssl rsa -in key.pem -text -noout
#
#       To just output the public part of a private key:
#
#        openssl rsa -in key.pem -pubout -out pubkey.pem
#
#       Output the public part of a private key in RSAPublicKey format:
#
#        openssl rsa -in key.pem -RSAPublicKey_out -out pubkey.pem


