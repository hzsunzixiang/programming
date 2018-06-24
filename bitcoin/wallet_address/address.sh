

# 这里在用这个交易做 例子
#https://www.blockchain.com/en/btc/tx/3f285f083de7c0acabd9f106a43ec42687ab0bebe2e6f0d529db696794540fea
#来验证钱包地址生成的过程
#同时验证
#
#Input Scripts 中提供的确实是公钥
#对应着交易输入中的比特币地址

#How to create Bitcoin Address
#
#1 - Take the corresponding public key generated with it (33 bytes, 1 byte 0x02 (y-coord is even), and 32 bytes corresponding to X coordinate)
#

PUBKEY="0414e301b2328f17442c0b8310d787bf3d8a404cfbd0704f135b6ad4b2d3ee751310f981926e53a6e8c39bd7d3fefd576c543cce493cbac06388f2651d1aacbfcd"

#
#2 - Perform SHA-256 hashing on the public key
#
printf "$PUBKEY" | xxd -r -p |sha256sum -b
#
#3 - Perform RIPEMD-160 hashing on the result of SHA-256
#

printf "$PUBKEY" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160

#result:   df3bd30160e6c6145baaf2c88a8844c13a00d1d5
#
#4 - Add version byte in front of RIPEMD-160 hash (0x00 for Main Network)
#
#  00df3bd30160e6c6145baaf2c88a8844c13a00d1d5
#
EXTEND160="00df3bd30160e6c6145baaf2c88a8844c13a00d1d5"
#(note that below steps are the Base58Check encoding, which has multiple library options available implementing it)
#5 - Perform SHA-256 hash on the extended RIPEMD-160 result
#
printf "$EXTEND160" | xxd -r -p |sha256sum -b
#  37b06a0b743770b3341b2eb456a47ea283154a7c691425b5cae246a2df4f75df 
#
#6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
#
printf "$EXTEND160" | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum -b
## f3526448ebcab3cb2a5ad6bf95498e9d79fe88d5d9d9d16e6c728d7fc0e3667a
#
#7 - Take the first 4 bytes of the second SHA-256 hash. This is the address checksum
#
## f3526448
#
#8 - Add the 4 checksum bytes from stage 7 at the end of extended RIPEMD-160 hash from stage 4. This is the 25-byte binary Bitcoin Address.
#
#  00df3bd30160e6c6145baaf2c88a8844c13a00d1d5f3526448
#
#9 - Convert the result from a byte string into a base58 string using Base58Check encoding. This is the most commonly used Bitcoin Address format
#
#ericksun@192.168.56.101:~/programming/bitcoin/wallet_address$ encodeBase58 "00df3bd30160e6c6145baaf2c88a8844c13a00d1d5f3526448"
#1MMMMSUb1piy2ufrSguNUdFmAcvqrQF8M5ericksun@192.168.56.101:~/programming/bitcoin/wallet_address$

# 载入环境变量
. bitcoin-bash-tools/bitcoin.sh
encodeBase58 "00df3bd30160e6c6145baaf2c88a8844c13a00d1d5f3526448"
# 结果为
# 1MMMMSUb1piy2ufrSguNUdFmAcvqrQF8M5 


# 堪称完美 perfect 一次过
