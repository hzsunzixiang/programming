#!/usr/bin/env python
# -*- coding UTF-8


# https://www.entrust.com/wp-content/uploads/2014/03/WP_Entrust_Zero-to-ECC_March2014.pdf
#y^2 = x^3 + a*x + b 
#StephenSun@debian-1:~/programming/cryptography/openssl/ecc_Parameters$ openssl ecparam -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1
#Field Type: prime-field
#Prime:
#    00:ff:ff:ff:ff:00:00:00:01:00:00:00:00:00:00:
#    00:00:00:00:00:00:ff:ff:ff:ff:ff:ff:ff:ff:ff:
#    ff:ff:ff
#A:   
#    00:ff:ff:ff:ff:00:00:00:01:00:00:00:00:00:00:
#    00:00:00:00:00:00:ff:ff:ff:ff:ff:ff:ff:ff:ff:
#    ff:ff:fc
#B:   
#    5a:c6:35:d8:aa:3a:93:e7:b3:eb:bd:55:76:98:86:
#    bc:65:1d:06:b0:cc:53:b0:f6:3b:ce:3c:3e:27:d2:
#    60:4b
#Generator (uncompressed):
#    04:6b:17:d1:f2:e1:2c:42:47:f8:bc:e6:e5:63:a4:
#    40:f2:77:03:7d:81:2d:eb:33:a0:f4:a1:39:45:d8:
#    98:c2:96:4f:e3:42:e2:fe:1a:7f:9b:8e:e7:eb:4a:
#    7c:0f:9e:16:2b:ce:33:57:6b:31:5e:ce:cb:b6:40:
#    68:37:bf:51:f5
#Order: 
#    00:ff:ff:ff:ff:00:00:00:00:ff:ff:ff:ff:ff:ff:
#    ff:ff:bc:e6:fa:ad:a7:17:9e:84:f3:b9:ca:c2:fc:
#    63:25:51
#Cofactor:  1 (0x1)
a=0x00ffffffff00000001000000000000000000000000fffffffffffffffffffffffc
b=0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b

a=0xb9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf
b=0xea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20

p = 0x00ffffffff00000001000000000000000000000000ffffffffffffffffffffffff
x=  0x6b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c296
y=  0x4fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5

print (x**3+a*x+b)%p
print (y**2)%p


# https://www.johannes-bauer.com/compsci/ecc/

#joequad joe [~]: openssl ecparam -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name secp112r1
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
#By removing all the colons, you already have the numbers you want in hexadecimal representation. Note that for the generator point G in uncompressed form you have to discard the first byte (0x04 indicates that the two points are encoded directly, without compression -- see section 2.3.3 of the SECG document for details), then comes the x- and y-component. So for this example, the values are:
