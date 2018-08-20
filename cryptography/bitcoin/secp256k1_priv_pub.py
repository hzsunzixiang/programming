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

# 意思是说对于 secp256k1 这条曲线 priv * (x,y) =  (x1,y1)(mod p)
# （x1,y1） 指的就是公钥
# 可以验证一下

# 以下面这个命令，生成一组参数
# openssl ecparam -genkey  -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name secp256k1|openssl ec -text

#Private-Key: (256 bit)
#priv:
#    1e:01:4d:45:cc:97:2c:ae:16:02:f6:9a:0c:ea:2e:
#    92:d9:69:1c:18:04:e2:3b:92:92:a0:6b:43:1a:8c:
#    57:e3
#pub:
#    04:d3:27:c3:65:40:c9:b0:68:74:5c:04:86:5b:cc:
#    72:84:9a:af:fb:b5:71:84:98:50:14:35:9c:40:bc:
#    8e:8d:1d:b6:d2:5a:9e:fa:4f:56:f2:6c:83:5c:6d:
#    69:5e:93:f8:f8:df:27:97:16:7d:c0:69:e6:c2:e9:
#    2c:92:c8:3c:c0
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
#-----BEGIN EC PRIVATE KEY-----
#MIIBEwIBAQQgHgFNRcyXLK4WAvaaDOouktlpHBgE4juSkqBrQxqMV+OggaUwgaIC
#AQEwLAYHKoZIzj0BAQIhAP////////////////////////////////////7///wv
#MAYEAQAEAQcEQQR5vmZ++dy7rFWgYpXOhwsHApv82y3OKNlZ8oFbFvgXmEg62ncm
#o8RlXaT7/A4RCKj9F7RIpoVUGZxH0I/7ENS4AiEA/////////////////////rqu
#3OavSKA7v9JejNA2QUECAQGhRANCAATTJ8NlQMmwaHRcBIZbzHKEmq/7tXGEmFAU
#NZxAvI6NHbbSWp76T1bybINcbWlek/j43yeXFn3AaebC6SySyDzA
#-----END EC PRIVATE KEY-----

# 这是参数 Prime:
p=2**256 - 2**32 - 977
a=0
b=7

# 这个是生成元
x1=0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
y1=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8

# 这个是公钥
x2= 0xd327c36540c9b068745c04865bcc72849aaffbb57184985014359c40bc8e8d1d
y2= 0xb6d25a9efa4f56f26c835c6d695e93f8f8df2797167dc069e6c2e92c92c83cc0

#pub:
#    04:d3:27:c3:65:40:c9:b0:68:74:5c:04:86:5b:cc:
#    72:84:9a:af:fb:b5:71:84:98:50:14:35:9c:40:bc:
#    8e:8d:1d:b6:d2:5a:9e:fa:4f:56:f2:6c:83:5c:6d:
#    69:5e:93:f8:f8:df:27:97:16:7d:c0:69:e6:c2:e9:
#    2c:92:c8:3c:c0
# result: ('0xd327c36540c9b068745c04865bcc72849aaffbb57184985014359c40bc8e8d1dL', '0xb6d25a9efa4f56f26c835c6d695e93f8f8df2797167dc069e6c2e92c92c83cc0L')


# 首先验证这2个点
print (x1**3+a*x1+b)%p == (y1**2)%p
print (x2**3+a*x2+b)%p == (y2**2)%p


# 这是私钥
#priv:
#    1e:01:4d:45:cc:97:2c:ae:16:02:f6:9a:0c:ea:2e:
#    92:d9:69:1c:18:04:e2:3b:92:92:a0:6b:43:1a:8c:
#    57:e3
# 验证公式为 (x2,y2) = priv(x1,y1)
priv = 0x1e014d45cc972cae1602f69a0cea2e92d9691c1804e23b9292a06b431a8c57e3


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
print " known:",(hex(x2),hex(y2)) 
print (x3,y3)==(x2,y2)



# 中间碰到的几个问题
# 1. ecc_double 的时候 里面的参数只有x1 y1


