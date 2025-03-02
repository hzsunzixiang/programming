#!/usr/bin/env python
# -*- coding UTF-8


# sect113r1
# Field Type: characteristic-two-field
# Basis Type: tpBasis
# Polynomial:
#     02:00:00:00:00:00:00:00:00:00:00:00:00:02:01
# A:   
#     30:88:25:0c:a6:e7:c7:fe:64:9c:e8:58:20:f7
# B:   
#     00:e8:be:e4:d3:e2:26:07:44:18:8b:e0:e9:c7:23
# Generator (uncompressed):
#     04:00:9d:73:61:6f:35:f4:ab:14:07:d7:35:62:c1:
#     0f:00:a5:28:30:27:79:58:ee:84:d1:31:5e:d3:18:
#     86
# Order: 
#     01:00:00:00:00:00:00:00:d9:cc:ec:8a:39:e5:6f
# Cofactor:  2 (0x2)

#https://en.wikipedia.org/wiki/Elliptic-curve_cryptography

#Since n is the size of a subgroup of {\displaystyle E(\mathbb {F} _{p})} E(\mathbb {F} _{p}) it follows from Lagrange's theorem that the number {\displaystyle h={\frac {1}{n}}|E(\mathbb {F} _{p})|} h={\frac {1}{n}}|E(\mathbb {F} _{p})| is an integer. In cryptographic applications this number h, called the cofactor, must be small ( {\displaystyle h\leq 4} h\leq 4) and, preferably, {\displaystyle h=1} h=1.
p=0x020000000000000000000000000201
n=0x0100000000000000d9ccec8a39e56f
Cofactor=p/1.0/n
print( Cofactor)



#======================================================================================
#sect233k1
#Field Type: characteristic-two-field
#Basis Type: tpBasis
#Polynomial:
#    02:00:00:00:00:00:00:00:00:00:00:00:00:00:00:
#    00:00:00:00:00:04:00:00:00:00:00:00:00:00:01
#A:    0
#B:    1 (0x1)
#Generator (uncompressed):
#    04:01:72:32:ba:85:3a:7e:73:1a:f1:29:f2:2f:f4:
#    14:95:63:a4:19:c2:6b:f5:0a:4c:9d:6e:ef:ad:61:
#    26:01:db:53:7d:ec:e8:19:b7:f7:0f:55:5a:67:c4:
#    27:a8:cd:9b:f1:8a:eb:9b:56:e0:c1:10:56:fa:e6:
#    a3
#Order: 
#    00:80:00:00:00:00:00:00:00:00:00:00:00:00:00:
#    06:9d:5b:b9:15:bc:d4:6e:fb:1a:d5:f1:73:ab:df
#Cofactor:  4 (0x4)

p=0x020000000000000000000000000000000000000004000000000000000001
n=0x008000000000000000000000000000069d5bb915bcd46efb1ad5f173abdf

Cofactor=p/1.0/n
print(Cofactor)

