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

# 这是参数 Prime:
p=2**256 - 2**32 - 977
a=0
b=7

# 这个是生成元
x1=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
y1=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8

# 这个是公钥
x2=0xb9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf
y2=0x473a9dbea3fb3ebcb43797a9583c634fd205c7d87469b0e4f2a5d3f6a794f424



# 首先验证这2个点
print ((x1**3+a*x1+b)%p == (y1**2)%p)
print ((x2**3+a*x2+b)%p == (y2**2)%p)


# 这是私钥
# 验证公式为 (x2,y2) = priv(x1,y1)
priv = 0xea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20


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

def ecc_cal(x1,y1,priv):
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
    return (x3, y3)

(x3, y3)=ecc_cal(x1, y1, priv)
print ("result---:",(hex(x3),hex(y3)))
print ("known---:",(hex(x2),hex(y2)))
print ((x3,y3)==(x2,y2))

#Order: 
#    00:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:
#    ff:fe:ba:ae:dc:e6:af:48:a0:3b:bf:d2:5e:8c:d0:
#    36:41:41

#这个即为素数阶 q
q=0x00fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141

#点A = (xa=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798, ya=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8)
# 这个是生成元 就是上面的(x1,y1)
xa=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
ya=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8


# 这个是公钥
xb=0xb9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf
yb=0x473a9dbea3fb3ebcb43797a9583c634fd205c7d87469b0e4f2a5d3f6a794f424


# 对 hashx进行签名
hashx=0x8d8351fcd1f284e5f22e4c60886911cc104fc302bd5debe4ea6bfbea1cd34684

#(p,a,b,q,A,B)   B为公钥
# (d)为私钥
# 曲线的p a b 上面已经给出
def signature(priv, hashx): 
    # 选择d的值 , d即为私钥
    d = priv 
    # 计算B=dA B即为公钥
    (xb, yb) = ecc_cal(xa,ya,d)
    # 这个其实就是公钥 
    print(hex(xb),hex(yb))

    # 对hashx进行签名
    # 选择一个整数作为临时随机密钥为kE = 0xabcdef123456 
    #R=kE* A
    kE = 0xabcdef123456 
    (xR, yR) = ecc_cal(xa,ya,kE)

    print(hex(xR),hex(yR))
   	#('0xe47c00b663b8f07eab08999d5bc02402d9f3129b77c1d049ecafea57345f1e80L', '0x8960e3b957cd2176eb574146d3b9c33b64fd7e999f5e490de703951110e3c0e3L')
    r=xR   # 0xe47c00b663b8f07eab08999d5bc02402d9f3129b77c1d049ecafea57345f1e80L
    # 计算kE 的逆元
    kE_reverse=modinv(kE, q)
    print("kE_reverse", hex(kE_reverse))
    s=((hashx+d*r)*kE_reverse)%q
    return (r,s)

(r,s) = signature(priv, hashx)
print((hex(r), hex(s)))


def verify_sign(r, s, hashx):
    s_reverse=modinv(s, q)
    w=s_reverse%q
    u1=(w*hashx)%q
    u2=(w*r)%q
    #P=u1*A+u2*B
    (u1A_x, u1A_y)=ecc_cal(xa,ya,u1)
    (u2B_x, u2B_y)=ecc_cal(xb,yb,u2) 
    (xp, yp) = ecc_add(u1A_x,u1A_y,u2B_x,u2B_y)
    return (xp, yp)

(xp,yp)=verify_sign(r,s,hashx)
print("xp:---", hex(xp))
print("r:---", hex(r))

if xp==r:
    print("success")
else:
    print("failed")

