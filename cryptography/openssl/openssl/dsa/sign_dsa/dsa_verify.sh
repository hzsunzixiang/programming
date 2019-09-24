
for i in 512 1024 2048 3072 4096 
do 
    # 生成额公钥
    openssl dsa -in  dsakey_$i.pem   -pubout -out pubkey_$i.pem 
done 


echo "private key verify"
for i in 512 1024 2048 3072 4096 
do 
    # 私钥验证 签名验证
    openssl dgst -sha256 -prverify dsakey_$i.pem  -signature  signature_$i.sign  file.txt
done 




echo "public key verify"
for i in 512 1024 2048 3072 4096 
do 
    # 公钥验证
    openssl dgst -sha256 -verify pubkey_$i.pem  -signature  signature_$i.sign  file.txt
done 
