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

# https://stackoverflow.com/questions/37377982/remove-the-0b-in-binary
# https://pythonspot.com/binary-numbers-and-logical-operators/
# https://stackoverflow.com/questions/1476/how-do-you-express-binary-literals-in-python
# https://en.wikipedia.org/wiki/Elliptic_curve_point_multiplication
#print(str(1)+"p:\t", (x1,y1))
# 必须得用算法才可以 不能这么蛮力
#  Q ← 0
#   for j ← i − 1 downto 0 do
#       Q ← point_double(Q)
#       if (dj != 0)
#           Q ← point_add(Q, djG)
#   return Q
# https://stackoverflow.com/questions/37377982/remove-the-0b-in-binary                                                                                    21:42:09 [19/1912]
# https://pythonspot.com/binary-numbers-and-logical-operators/
# https://stackoverflow.com/questions/1476/how-do-you-express-binary-literals-in-python
# https://en.wikipedia.org/wiki/Elliptic_curve_point_multiplication
#print(str(1)+"p:\t", (x1,y1))
# 必须得用算法才可以 不能这么蛮力
#  Q ← 0
#   for j ← i − 1 downto 0 do
#       Q ← point_double(Q)
#       if (dj != 0)
#           Q ← point_add(Q, djG)
#   return Q

# 然后用 算法实现
#i=0
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

if __name__ == '__main__':
    # 这是参数 Prime:
    p=0x00fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    a=0x00
    b=0x7
    # 这个是生成元
    x1=0x79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798
    y1=0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8
    priv=0x6c291945f71026b9fe090220429ea0f1b2f1834054dc44de79dd9d3db39e4bb4
    (x3, y3)=ecc_cal(x1, y1, priv)
    print("result---:",(hex(x3),hex(y3)))
# 完全匹配得上
#read EC key
#Private-Key: (256 bit)
#priv:
#    6c:29:19:45:f7:10:26:b9:fe:09:02:20:42:9e:a0:
#    f1:b2:f1:83:40:54:dc:44:de:79:dd:9d:3d:b3:9e:
#    4b:b4
#pub:
#    04:de:3f:25:c9:48:e3:4d:0b:69:64:62:d8:f9:14:
#    b3:91:e7:b3:d8:55:9d:b1:c3:bd:4f:03:55:cc:0a:
#    b0:c9:c6:ca:09:e8:33:03:68:59:77:13:a5:30:e2:
#    00:6a:26:80:df:3c:e1:15:b8:90:ae:32:ad:b0:fd:
#    46:68:cc:95:f9
#Field Type: prime-field
#Prime:
#    00:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:
#    ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:fe:ff:
#    ff:fc:2f
#A:    0
#B:    7 (0x7)
#Generator (uncompressed):
#    04:79:be:66:7e:f9:dc:bb:ac:55:a0:62:95:ce:87:
#    0b:07:02:9b:fc:db:2d:ce:28:d9:59:f2:81:5b:16:
#    f8:17:98:48:3a:da:77:26:a3:c4:65:5d:a4:fb:fc:
#    0e:11:08:a8:fd:17:b4:48:a6:85:54:19:9c:47:d0:
#    8f:fb:10:d4:b8
#Order:
#    00:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:ff:
#    ff:fe:ba:ae:dc:e6:af:48:a0:3b:bf:d2:5e:8c:d0:
#    36:41:41
#Cofactor:  1 (0x1)
