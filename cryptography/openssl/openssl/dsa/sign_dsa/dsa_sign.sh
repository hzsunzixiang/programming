#openssl dsaparam -genkey 2048

#openssl dsaparam -noout -out dsakey.pem -genkey 1024
#openssl dsaparam -out key.pem -genkey 2048

## 合在一起
# openssl dsaparam -genkey 2048  |openssl dsa -out dsa.key -aes128
#
## 输出到标准输出
# openssl dsa -in dsa.key -text
## 输出到key.txt
# openssl dsa -in dsa.key -text  -out key.txt

echo "hello,world"> file.txt
rm *.sign
for i in 512 1024 2048 3072 4096 
do 
    # 生成密钥
    openssl dsaparam -noout -out dsakey_$i.pem -genkey $i 
    #openssl dsa -in  dsakey_2048.pem   -pubout -out pubkey_2048.pem 
    
    # 签名
    openssl dgst -sha256 -sign dsakey_$i.pem  -out signature_$i.sign file.txt 
done 





# 输出参数 
#openssl dsa -in  dsakey_2048.pem -noout  -text

# 输出公钥
#openssl dsa -in  dsakey_2048.pem   -pubout -out pubkey_2048.pem 
# HASH
#openssl dgst -sha256  file.txt


#       -verify filename
#           Verify the signature using the public key in "filename".  The output is either "Verification OK" or "Verification Failure".
#
#       -prverify filename
#           Verify the signature using the private key in "filename".
#
#       -signature filename
#           The actual signature to verify.

