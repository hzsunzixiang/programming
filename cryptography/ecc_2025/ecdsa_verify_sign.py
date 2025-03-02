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

# 然后用 算法实现
def ecc_double(x1,y1):
    s=((3*(x1**2)+a)*modinv(2*y1,p))%p
    x3=(s**2-x1-x1)%p
    y3=(s*(x1-x3)-y1)%p
    return (x3,y3)

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


#(p,a,b,q,A,B)   B为公钥
# (d)为私钥
# 曲线的p a b 上面已经给出
def signature(priv, hashx, xa, ya): 
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


def verify_sign(r, s, hashx, q, xa, ya):
    s_reverse=modinv(s, q)
    w=s_reverse%q
    u1=(w*hashx)%q
    u2=(w*r)%q
    #P=u1*A+u2*B
    (u1A_x, u1A_y)=ecc_cal(xa,ya,u1)
    (u2B_x, u2B_y)=ecc_cal(xb,yb,u2) 
    (xp, yp) = ecc_add(u1A_x,u1A_y,u2B_x,u2B_y)
    return (xp, yp)
if __name__ == '__main__':
    # 这是参数 Prime:
    p=2**256 - 2**32 - 977
    a=0
    b=7
    # 这是私钥
    priv = 0xea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20
    #这个即为素数阶 q
    q=0x00fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141
    # 这个是生成元 
    xa=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
    ya=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8
    # 这个是公钥
    xb=0xb9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf
    yb=0x473a9dbea3fb3ebcb43797a9583c634fd205c7d87469b0e4f2a5d3f6a794f424
    # 对 hashx进行签名
    hashx=0x8d8351fcd1f284e5f22e4c60886911cc104fc302bd5debe4ea6bfbea1cd34684
    
    # 用私钥 签名
    (r,s) = signature(priv, hashx, xa, ya)
    print((hex(r), hex(s)))
    
    (xp,yp)=verify_sign(r,s,hashx, q, xa, ya)
    print("xp:---", hex(xp))
    print("r:---", hex(r))
    
    if xp==r:
        print("success")
    else:
        print("failed")
    
