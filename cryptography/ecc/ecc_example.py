#!/usr/bin/env python
# -*- coding UTF-8



#y^2 = x^3 + a*x + b 

#a=-3
#b=0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b
#p = 115792089210356248762697446949407573530086143415290314195533631308867097853951
#gx = 0x6b17d1f2e12c4247f8bce6e577037d812deb33a0f4a13945d898c296
#gy = 0x4fe342e2fe1a7f9b8ee7eb4a2bce33576b315ececbb6406837bf51f5
#
#print (gx**3+(-3)*gx+b)%p
#print (gy**2)%p

#p=0x00db7c2abf62e35e668076bead208b
#a=0x00db7c2abf62e35e668076bead2088
#b=0x659ef8ba043916eede8911702b22
#x=0x0409487239995a5ee76b55f9c2f098
#y=0xa89ce5af8724c0a23e0e0ff77500


#a=0
#b=3
#p=0xfffffffffffffffffffffffffffffffffffffffeffffee37
#n=0xfffffffffffffffffffffffe26f2fc170f69466a74defd8d
#x=0xdb4ff10ec057e9ae26b07d0280b7f4341da5d1b1eae06c7d
#y=0x9b2f2f6d9c5628a7844163d015be86344082aa88d95e2f9d


#p=0x00db7c2abf62e35e668076bead208b
#a=0x00db7c2abf62e35e668076bead2088
#b=0x659ef8ba043916eede8911702b22
##x=0x0409487239995a5ee76b55f9c2f098
#x=0x9487239995a5ee76b55f9c2f098
#y=0xa89ce5af8724c0a23e0e0ff77500


p=0x00db7c2abf62e35e668076bead208b
a=0x00db7c2abf62e35e668076bead2088
b=0x659ef8ba043916eede8911702b22
#x=0x0409487239995a5ee76b55f9c2f098
x=0x009487239995a5ee76b55f9c2f098
y=0xa89ce5af8724c0a23e0e0ff77500

print (x**3+a*x+b)%p
print (y**2)%p

print (x**3+a*x+b)
print (y**2)



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
