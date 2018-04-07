 openssl dsaparam -genkey 2048
 openssl dsaparam -genkey 2048 -out key.pem

# 合在一起
 openssl dsaparam -genkey 2048  |openssl dsa -out dsa.key -aes128

# 输出到标准输出
 openssl dsa -in dsa.key -text
# 输出到key.txt
 openssl dsa -in dsa.key -text  -out key.txt
