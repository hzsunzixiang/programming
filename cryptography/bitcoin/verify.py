#!/usr/bin/env python
# -*- coding:UTF-8


# 这是为了验证biticoin的 公私钥地址的
# 背景知识在最下面

# 这个算法不错 是欧几里得扩展算法
def extended_gcd(aa, bb):
    lastremainder, remainder = abs(aa), abs(bb)
    x, lastx, y, lasty = 0, 1, 1, 0
    while remainder:
        lastremainder, (quotient, remainder) = remainder, divmod(lastremainder, remainder)
        x, lastx = lastx - quotient*x, x
        y, lasty = lasty - quotient*y, y
    return lastremainder, lastx * (-1 if aa < 0 else 1), lasty * (-1 if bb < 0 else 1)
 
def modinv(a, m):
    g, x, y = extended_gcd(a, m)
    if g != 1:
    	raise ValueError
    return x % m

# 意思是说对于 secp256k1 这条曲线 priv * (x,y) =  (x1,y1)(mod p)
# （x1,y1） 指的就是公钥
# 可以验证一下

# 以下面这个命令，生成一组参数
# openssl ecparam -genkey  -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name secp256k1|openssl ec -text

# 这是参数 Prime:
p=2**256 - 2**32 - 977
a=0
b=7

# 这个是生成元
x1=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
y1=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8


# 首先验证这2个点
print (x1**3+a*x1+b)%p == (y1**2)%p
#print (x2**3+a*x2+b)%p == (y2**2)%p

# 验证公式为 (x2,y2) = priv(x1,y1)
#priv = 0x0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF9
priv = 0xea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20

# 符合
#result: ('0xb9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94dafL', '0x473a9dbea3fb3ebcb43797a9583c634fd205c7d87469b0e4f2a5d3f6a794f424L')

#"pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
# 对应私钥这个需要解密的 ea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20


# https://stackoverflow.com/questions/37377982/remove-the-0b-in-binary
# https://pythonspot.com/binary-numbers-and-logical-operators/
# https://stackoverflow.com/questions/1476/how-do-you-express-binary-literals-in-python
# https://en.wikipedia.org/wiki/Elliptic_curve_point_multiplication

#print str(1)+"p:\t", (x1,y1)
# 必须得用算法才可以 不能这么蛮力
#  Q ← 0
#   for j ← i − 1 downto 0 do
#       Q ← point_double(Q)
#       if (dj != 0)
#           Q ← point_add(Q, djG)
#   return Q

#for i in range(2,priv):



# 然后用 算法实现
#i=0
def ecc_double(x1,y1):
    s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    x3=(s**2-x1-x1)%p
    y3=(s*(x1-x3)-y1)%p
    return (x3,y3)
#print ecc_double(x1,y1)

def ecc_add(x1,y1,x2,y2):
    s = 0
    if (x1==x2):
        s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    else:
        s=((y2-y1)*modinv(x2-x1,p))%p
    x3=(s**2-x1-x2)%p
    y3=(s*(x1-x3)-y1)%p
    return (x3,y3)
#print ecc_add(x1,y1,x2,y2)
#print str(bin(priv)).replace("0b","")

(x3,y3)=(0,0)
(x_tmp,y_tmp)=(x1,y1)
init=0  #初始化设置
for b in str(bin(priv)[2:]):
    #print b
    if (b=='1') and (init==0):
       init=1
    elif (b=='1') and (init==1):
       (x3,y3)=ecc_double(x_tmp,y_tmp)
       (x3,y3)=ecc_add(x1,y1,x3,y3)
       (x_tmp, y_tmp) = (x3,y3)
    else:
       (x3,y3)=ecc_double(x_tmp,y_tmp)
       (x_tmp, y_tmp) = (x3,y3)
print "result:",(hex(x3),hex(y3)) 
#print " known:",(hex(x2),hex(y2)) 
#print (x3,y3)==(x2,y2)

# 结果跟公钥一致
#  "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",


## 获取到地址
#ericksun@192.168.56.101:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
#[
#  "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy",
#  "2N7W2N2sZYbQ7h7BK55iR5JBbGzMbo42QFF",
#  "2N8w6HGi6bzuZEhfiv8i1RedHezVA1KvuLx",
#  "2NBcGGR2RW5FHdXEM1vW3ep6uBsQaUg9YpJ",
#  "2NEj1PfA5YNEP9LqTQp9jGwadEg8hJCb53N"
#]
#
#
## 获取到公钥 "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
#rt getaddressinfo 2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy
#{
#  "address": "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy",
#  "scriptPubKey": "a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee787",
#  "ismine": true,
#  "iswatchonly": false,
#  "isscript": true,
#  "iswitness": false,
#  "script": "witness_v0_keyhash",
#  "hex": "0014dea077b40bd2fde2740a1b746d8b4034e32f46ee",
#  "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
#  "embedded": {
#    "isscript": false,
#    "iswitness": true,
#    "witness_version": 0,
#    "witness_program": "dea077b40bd2fde2740a1b746d8b4034e32f46ee",
#    "pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
#    "address": "bcrt1qm6s80dqt6t77yaq2rd6xmz6qxn3j73hwtml9hu",
#    "scriptPubKey": "0014dea077b40bd2fde2740a1b746d8b4034e32f46ee"
#  },
#  "account": "",
#  "timestamp": 1533607947,
#  "hdkeypath": "m/0'/0'/2'",
#  "hdmasterkeyid": "c40200dd0082e2db353c39a1b8f52e896d4c0710"
#}
#
#
## 获取到私钥
#rt dumpprivkey "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy"
#
#cN7KpCzkTUgtCNGhewHJfbij7eJWWznH4YZ7BnnMJDUq5kn6cFxF
#
#
## https://en.bitcoin.it/wiki/List_of_address_prefixes
#
#
##239	EF	Testnet Private key (WIF, uncompressed pubkey)	9	92Pg46rUhgTT7romnV7iGW6W1gbGdeezqdbJCzShkCsYNzyyNcc
##239	EF	Testnet Private key (WIF, compressed pubkey)	c	cNJFgo1driFnPcBdBX8BrJrpxchBWXwXCvNH5SoSkdcF6JXXwHMm
#
#
## 解析出来
#
## 载入环境变量
#. bitcoin-bash-tools/bitcoin.sh
#decodeBase58 cN7KpCzkTUgtCNGhewHJfbij7eJWWznH4YZ7BnnMJDUq5kn6cFxF 
#
#
#用这个脚本验证 ~/programming/bitcoin/wallet_address/address_regtest.sh
#解码出来
#EF0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF9019092E324
#扔掉最后四个字节的校验码
#EF0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF901
#
#扔掉最后一个字节 01  表示是压缩格式
#0FC100A343C8A4D1B63E01A5E2CC8E6EA6587DD7CDCEBB69B8B6B5069962CAF901
#
#
## 用这个脚本来验证
#~/programming/cryptography/bitcoin/verify.py
#result: ('0xa11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294L', '0x277a45b4d055c9e52d0383e575dfabb05aefef50f8e626977f518c699e3c3821L')
#
#"pubkey": "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294",
#
#从而验证跟pubkey 是一致的，这个格式是压缩格式
#
