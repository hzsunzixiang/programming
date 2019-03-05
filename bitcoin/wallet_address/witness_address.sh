

# https://github.com/bitcoin/bips/blob/master/bip-0013.mediawiki
# witness 的生成地址 和其他不一样

# 流程大概为:
# 由公钥生成 rmd160 加上前缀
# 由结果再生成一次rmd160  : 这里多做了一次 rmd160
# 然后才得到 钱包地址

#Input Scripts 中提供的确实是公钥
#对应着交易输入中的比特币地址

#How to create Bitcoin Address
#
#1 - Take the corresponding public key generated with it (33 bytes, 1 byte 0x02 (y-coord is even), and 32 bytes corresponding to X coordinate)
#
####################
# 由公钥得到公钥hash 进而组合成 0014+pubkeyhash, 再进行hash 然后组合成scriptPubKey a914 + hash160(0014+pubkeyhash) + 87
# 从而如果提供公钥 用scriptPubKey 就能证明所有人的公钥正确； 再结合签名证明所有人的签名正确
#StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressinfo 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ
#{
#  "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
#  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887", 
#        # 对应输出的 "scriptPubKey" #0xa9 指的是 OP_HASH160 指令 0x14指的是长度 0x87=OP_EQUAL
#        # *script << OP_HASH160 << ToByteVector(scriptID) << OP_EQUAL;
#	    # 0xa9 + 0x14 + （pubhash）+ 0x87
#
#        # 这个体现在 vout 中
#        # 这个 scriptPubKey 的生成方式 
#        # 在非 sigwit的交易中 这个 脚本中其实就是 公钥的hash
#        #"asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
#        #"hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
#        # https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki
#        # 这里有描述 但是没有得知如何计算出的这个
#        # 恍然大悟 原来 077a414c3d707eaff2718369bad42b26878279c8 是对 下面的hex 也就是 0014+pubkeyhash 又做了一次hash
#        # 0014682f951f473c437f4489af026e5bfb1d1ed22aa3 也就是 
#        # StephenSun@debian-1:~/bitcoin/study/gdb$ printf   0014682f951f473c437f4489af026e5bfb1d1ed22aa3 | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
#        # (stdin)= 077a414c3d707eaff2718369bad42b26878279c8
#        # 由 hex 到 scriptPubKey 是单向的， 所以 在输入中提供的hex， 可以验证之前的上一个输出
#
#  "ismine": true,
#  "iswatchonly": false,
#  "isscript": true,
#  "iswitness": false,
#  "script": "witness_v0_keyhash",
#  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",  # (0x0014{20-byte-key-hash}) 0x0014 加上对公钥的hash
#        # 这个体现在 vin 中
#        # 公钥hash的生成方式 已经清楚
#        #StephenSun@debian-1:~/bitcoin/study/gdb$ printf  "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
#        #(stdin)= 682f951f473c437f4489af026e5bfb1d1ed22aa3
#  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
#        # 这个 是真正的公钥pubkey 已经清楚
#  "embedded": {
#    "isscript": false,
#    "iswitness": true,
#    "witness_version": 0,
#    "witness_program": "682f951f473c437f4489af026e5bfb1d1ed22aa3",  # 这里是公钥的hash 参看上面  已经清楚
#    "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",  # 已经清楚
#    "address": "bcrt1qdqhe286883ph73yf4upxuklmr50dy24ra7qpd0",
#    "scriptPubKey": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3"  # 已经清楚 就是 0x0014 +  公钥hash
#  },
#  "account": "",
#  "timestamp": 1533402402,
#  "hdkeypath": "m/0'/0'/0'",
#  "hdmasterkeyid": "ed118f14056f4115cf6bbb0482bd17edd041e85c"
#}
#####################


PUBKEY="02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"

#
#2 - Perform SHA-256 hashing on the public key
#
printf "$PUBKEY" | xxd -r -p |sha256sum -b
#
#3 - Perform RIPEMD-160 hashing on the result of SHA-256
#

printf "$PUBKEY" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
printf "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160

# 这个也就是公钥的hash， 注意对照上面
#result: 682f951f473c437f4489af026e5bfb1d1ed22aa3 
#
#4 - Add version byte in front of RIPEMD-160 hash (0x00 for Main Network)
#
# 0014682f951f473c437f4489af026e5bfb1d1ed22aa3 
#
# 然后做rmd160
# printf   0014682f951f473c437f4489af026e5bfb1d1ed22aa3 | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160

EXTEND160="0014682f951f473c437f4489af026e5bfb1d1ed22aa3"
printf   0014682f951f473c437f4489af026e5bfb1d1ed22aa3 | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160

# 得到 077a414c3d707eaff2718369bad42b26878279c8

# $15 = std::vector of length 25, capacity 25 = {0xc4, 0x7, 0x7a, 0x41, 0x4c, 0x3d, 0x70, 0x7e, 0xaf, 0xf2, 0x71, 0x83, 0x69, 0xba, 0xd4, 0x2b, 0x26, 0x87, 0x82, 0x79, 0xc8, 0xa7, 0x6c, 0x68, 0x97}

# regtest 网络加上前缀 c4

# 得到 c4077a414c3d707eaff2718369bad42b26878279c8

#(note that below steps are the Base58Check encoding, which has multiple library options available implementing it)
#5 - Perform SHA-256 hash on the extended RIPEMD-160 result
#
printf "c4077a414c3d707eaff2718369bad42b26878279c8" | xxd -r -p |sha256sum -b
# 1625c97df72eab3f9bb17c3aead81b0494c8a9250d6c9b05b8525a6e8727d410
#
#6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
#
printf "c4077a414c3d707eaff2718369bad42b26878279c8" | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum -b

# a76c689754f7962a9ccad94e7e52ca44cf31e577c73ab62935a0b14213f2a5cd 
#
#7 - Take the first 4 bytes of the second SHA-256 hash. This is the address checksum
#
# a76c6897
#
#8 - Add the 4 checksum bytes from stage 7 at the end of extended RIPEMD-160 hash from stage 4. This is the 25-byte binary Bitcoin Address.
#
EXTEND160_SUFF="c4077a414c3d707eaff2718369bad42b26878279c8a76c6897"
#
#9 - Convert the result from a byte string into a base58 string using Base58Check encoding. This is the most commonly used Bitcoin Address format
#

# 载入环境变量
. bitcoin-bash-tools/bitcoin.sh
encodeBase58 $EXTEND160_SUFF
# 结果为
# 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ 

