#!/usr/bin/env python
# -*- coding:UTF-8



# 这个算法太暴力  
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

# 意思是说对于 secp112r1 这条曲线 priv * (x,y) =  (x1,x2)(mod p)
# （x1,x2） 指的就是公钥
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
p=0x00db7c2abf62e35e668076bead208b
a=0x00db7c2abf62e35e668076bead2088
b=0x659ef8ba043916eede8911702b22

x1=x2=0x09487239995a5ee76b55f9c2f098
y1=y2=0xa89ce5af8724c0a23e0e0ff77500
#Order: 
priv = 0x1177853dd299b78766e534147c39
print str(1)+"p:\t", (x1,y1)
# 必须得用算法才可以 不能这么蛮力
#for i in range(2,priv):
i=0
while True:
    s = 0
    if (x1==x2):
        s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    else:
        s=((y2-y1)*modinv(x2-x1,p))%p
    x3=(s**2-x1-x2)%p
    y3=(s*(x1-x3)-y1)%p
    print str(i)+"p:\t", (x3,y3)
    (x2,y2)=(x3,y3)
    i=i+1
