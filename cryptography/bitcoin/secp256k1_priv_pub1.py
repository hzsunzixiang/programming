#!/usr/bin/env python
# -*- coding:UTF-8



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

# 意思是说对于 secp112r1 这条曲线 priv * (x,y) =  (x1,y1)(mod p)
# （x1,y1） 指的就是公钥
# 可以验证一下

#Private-Key: (112 bit)
#priv:
#    11:77:85:3d:d2:99:b7:87:66:e5:34:14:7c:39
#pub: 
#    04:20:8a:1b:99:b9:ae:51:97:c7:e7:a7:2f:7b:46:
#    b3:91:c6:4c:ae:de:60:83:5b:8d:31:90:d4:47
#ASN1 OID: secp112r1
#-----BEGIN EC PRIVATE KEY-----
#MD4CAQEEDhF3hT3SmbeHZuU0FHw5oAcGBSuBBAAGoSADHgAEIIobmbmuUZfH56cv
#e0azkcZMrt5gg1uNMZDURw==
#-----END EC PRIVATE KEY-----

#secp112r1
#Field Type: prime-field
#Prime:
#    00:db:7c:2a:bf:62:e3:5e:66:80:76:be:ad:20:8b
#A:   
#    00:db:7c:2a:bf:62:e3:5e:66:80:76:be:ad:20:88
#B:   
#    65:9e:f8:ba:04:39:16:ee:de:89:11:70:2b:22
#Generator (uncompressed):
#    04:09:48:72:39:99:5a:5e:e7:6b:55:f9:c2:f0:98:
#    a8:9c:e5:af:87:24:c0:a2:3e:0e:0f:f7:75:00
#Order: 
#    00:db:7c:2a:bf:62:e3:5e:76:28:df:ac:65:61:c5
#Cofactor:  1 (0x1)

#Prime:
p=2**256 - 2**32 - 977
a=0
b=7

# 这个是生成元
x1=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
y1=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8

# 这个是公钥
#x2= 0x208a1b99b9ae5197c7e7a72f7b46
#y2= 0xb391c64caede60835b8d3190d447
# 首先验证这2个点
print (x1**3+a*x1+b)%p == (y1**2)%p
#print (x2**3+a*x2+b)%p == (y2**2)%p

# 以这个例子做验证
#Private key: 97ddae0f3a25b92268175400149d65d6887b9cefaf28ea2c078e05cdc15a3c0a
#Public key: 7b83ad6afb1209f3c82ebeb08c0c5fa9bf6724548506f2fb4f991e2287a77090177316ca82b0bdf70cd9dee145c3002c0da1d92626449875972a27807b73b42e
#Public key (compressed): 027b83ad6afb1209f3c82ebeb08c0c5fa9bf6724548506f2fb4f991e2287a77090
#Msg: Message for signing
#Msg hash: ce7df6b1b2852c5c156b683a9f8d4a8daeda2f35f025cb0cf34943dcac70d6a3
#Signature: [v = 1, r = 6f0156091cbe912f2d5d1215cc3cd81c0963c8839b93af60e0921b61a19c5430, s = 0c71006dd93f3508c432daca21db0095f4b16542782b7986f48a5d0ae3c583d4]
#
#Recovered public key: 7b83ad6afb1209f3c82ebeb08c0c5fa9bf6724548506f2fb4f991e2287a77090177316ca82b0bdf70cd9dee145c3002c0da1d92626449875972a27807b73b42e
#Signature valid? true

# 这是私钥
# 验证公式为 (x2,y2) = priv(x1,y1)
priv = 0x97ddae0f3a25b92268175400149d65d6887b9cefaf28ea2c078e05cdc15a3c0a
#Public key: 7b83ad6afb1209f3c82ebeb08c0c5fa9bf6724548506f2fb4f991e2287a77090177316ca82b0bdf70cd9dee145c3002c0da1d92626449875972a27807b73b42e
#Public key (compressed): 027b83ad6afb1209f3c82ebeb08c0c5fa9bf6724548506f2fb4f991e2287a77090

result: ('0x7b83ad6afb1209f3c82ebeb08c0c5fa9bf6724548506f2fb4f991e2287a77090L', '0x177316ca82b0bdf70cd9dee145c3002c0da1d92626449875972a27807b73b42eL')



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
#print " known:",(x2,y2) 
#print (x3,y3)==(x2,y2)



# 中间碰到的几个问题
# 1. ecc_double 的时候 里面的参数只有x1 y1
