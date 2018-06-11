


# 这里在用这个交易做 例子
#https://www.blockchain.com/en/btc/tx/c92ad3cb375aca80e8b2b740f24130a52d6fdfb24b3effa5b3f97abb99a84393

#来验证钱包地址生成的过程
#同时验证
#
#Input Scripts 中提供的确实是公钥
#对应着交易输入中的比特币地址

#How to create Bitcoin Address
#
#1 - Take the corresponding public key generated with it (33 bytes, 1 byte 0x02 (y-coord is even), and 32 bytes corresponding to X coordinate)
#

PUBKEY="04fe43d0c2c3daab30f9472beb5b767be020b81c7cc940ed7a7e910f0c1d9feef10fe85eb3ce193405c2dd8453b7aeb6c1752361efdbf4f52ea8bf8f304aab37ab"

#
#2 - Perform SHA-256 hashing on the public key
#
printf "$PUBKEY" | xxd -r -p |sha256sum -b
#
#3 - Perform RIPEMD-160 hashing on the result of SHA-256
#

printf "$PUBKEY" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160

#result:  c8e90996c7c6080ee06284600c684ed904d14c5c 
#
#4 - Add version byte in front of RIPEMD-160 hash (0x00 for Main Network)
#
# 00c8e90996c7c6080ee06284600c684ed904d14c5c 
#
EXTEND160="00c8e90996c7c6080ee06284600c684ed904d14c5c"
#(note that below steps are the Base58Check encoding, which has multiple library options available implementing it)
#5 - Perform SHA-256 hash on the extended RIPEMD-160 result
#
printf "$EXTEND160" | xxd -r -p |sha256sum -b
# 1625c97df72eab3f9bb17c3aead81b0494c8a9250d6c9b05b8525a6e8727d410
#
#6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
#
printf "$EXTEND160" | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum -b
# 77d528ed8472ee4c6475842868382d68c81bc4845503f278993289f3029c72f0
#
#7 - Take the first 4 bytes of the second SHA-256 hash. This is the address checksum
#
# 77d528ed
#
#8 - Add the 4 checksum bytes from stage 7 at the end of extended RIPEMD-160 hash from stage 4. This is the 25-byte binary Bitcoin Address.
#
EXTEND160_SUFF="00c8e90996c7c6080ee06284600c684ed904d14c5c77d528ed"
#
#9 - Convert the result from a byte string into a base58 string using Base58Check encoding. This is the most commonly used Bitcoin Address format
#

# 载入环境变量
. bitcoin-bash-tools/bitcoin.sh
encodeBase58 $EXTEND160_SUFF
# 结果为
# 1KKKK6N21XKo48zWKuQKXdvSsCf95ibHFa 
