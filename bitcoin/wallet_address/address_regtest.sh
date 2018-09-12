

# 获取到地址
ericksun@192.168.56.101:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
[
  "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy",
  "2N7W2N2sZYbQ7h7BK55iR5JBbGzMbo42QFF",
  "2N8w6HGi6bzuZEhfiv8i1RedHezVA1KvuLx",
  "2NBcGGR2RW5FHdXEM1vW3ep6uBsQaUg9YpJ",
  "2NEj1PfA5YNEP9LqTQp9jGwadEg8hJCb53N"
]


# 获取到公钥 "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
rt getaddressinfo 2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy
{
  "address": "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy",
  "scriptPubKey": "a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee787",
  "ismine": true,
  "iswatchonly": false,
  "isscript": true,
  "iswitness": false,
  "script": "witness_v0_keyhash",
  "hex": "0014dea077b40bd2fde2740a1b746d8b4034e32f46ee",
  "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
  "embedded": {
    "isscript": false,
    "iswitness": true,
    "witness_version": 0,
    "witness_program": "dea077b40bd2fde2740a1b746d8b4034e32f46ee",
    "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
    "address": "bcrt1qm6s80dqt6t77yaq2rd6xmz6qxn3j73hwtml9hu",
    "scriptPubKey": "0014dea077b40bd2fde2740a1b746d8b4034e32f46ee"
  },
  "account": "",
  "timestamp": 1533607947,
  "hdkeypath": "m/0'/0'/2'",
  "hdmasterkeyid": "c40200dd0082e2db353c39a1b8f52e896d4c0710"
}


# 获取到私钥
rt dumpprivkey "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy"

cN7KpCzkTUgtCNGhewHJfbij7eJWWznH4YZ7BnnMJDUq5kn6cFxF


# 这里列出来所有的 前缀  List of address prefixes
c开头说明是压缩格式的
#https://en.bitcoin.it/wiki/List_of_address_prefixes
#
#239	EF	Testnet Private key (WIF, uncompressed pubkey)	9	92Pg46rUhgTT7romnV7iGW6W1gbGdeezqdbJCzShkCsYNzyyNcc
#239	EF	Testnet Private key (WIF, compressed pubkey)	c	cNJFgo1driFnPcBdBX8BrJrpxchBWXwXCvNH5SoSkdcF6JXXwHMm




# 解析出来

# 载入环境变量
. bitcoin-bash-tools/bitcoin.sh
decodeBase58 cN7KpCzkTUgtCNGhewHJfbij7eJWWznH4YZ7BnnMJDUq5kn6cFxF 

# 下面开始验证
# 解码出来
EF0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF9019092E324

# 扔掉最后四个字节的校验码
EF0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF901

# 这里可以做校验 
printf EF0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF901 | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum -b
#9092e32436396641f2ad3099c5572a646024852f854a4af654a655451f99871f
# 结果的 最后四个字节为 9092e324

# 扔掉最后一个字节 01  表示是压缩格式 这个就是最终的私钥
0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF901


# 用这个脚本来验证
~/programming/cryptography/bitcoin/verify.py
result: ('0xa11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294L', '0x277a45b4d055c9e52d0383e575dfabb05aefef50f8e626977f518c699e3c3821L')

"pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",

#从而验证跟pubkey 是一致的，这个格式是压缩格式










