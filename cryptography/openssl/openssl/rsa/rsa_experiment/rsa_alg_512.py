#!/usr/bin/env python
# -*- coding:UTF-8
#




modulus = 0x00bef44890ef9254d6f7e990620c2273ab17afa4ffae9dcab1b1d85ec26924892398c700b013b88c4214108412701cb28cfddce816d9ee75a3e5e4df92dee8ba61
publicExponent =  0x10001
privateExponent = 0x7bea88a0cd66f7795cfe0bbd24c4c2ad17bcdae5354a9e7bbbbe7e97c8a575fc2b1d88bc41e6b93cf8e7f185fb287375f2d7d8901118a39a943d39f98ba1f2c1
prime1 = 0x00fce77123bef3689f880f798158dc5340dd572e8dcdd2b1544192ee96ca34d879
prime2 = 0x00c14ab38a1fcb12d18a268d3e2b4fc4267f7016a804ef61a53ba4bcb9b68cc729
exponent1 = 0x00aca83d3f902f912fc8adf7dfec908e6dec2e86e3dcae88cde2eeb2e0532ffcd1
exponent2 = 0x0bd6b5746a4a17d6f9ad2ecd75fda6b7ecea4298fbe46588a74489c29e29b531
coefficient = 0x00a937d19f6c1783cb1b023be59cee60589f29a7b68c1f70349c70eb698235c861

# modulus publicExponent privateExponent prime1 prime2  exponent1  exponent2  coefficient


def modInverse(a, m) :
    a = a % m;
    for x in range(1, m) :
        if ((a * x) % m == 1) :
            return x
    return 1

## Driver Program
#a = 2
#m = 17
#print(modInverse(a, m))

#https://crypto.stackexchange.com/questions/6593/what-data-is-saved-in-rsa-private-key
#  Modulus (n=pq)
#  Public exponent (e)
#  Private exponent (d=e−1\mathchoice(modϕ(n)))
#  First prime (p)
#  Second prime (q)
#  First exponent, used for Chinese remainder theorem (dP=d\mathchoice(modp−1))
#  Second exponent, used for CRT (dQ=d\mathchoice(modq−1))
#  Coefficient, used for CRT (qinv=q−1\mathchoice(modp))

# https://www.di-mgt.com.au/crt_rsa.html
# The Chinese Remainder Theorem - special case
# A special case of the Chinese Remainder Theorem (CRT) can be written as follows.
# 
# Theorem. Let p and q be distinct primes and n = p.q. For any pair (x1, x2) where 0 ≤ x1 < p and 0 ≤ x2 < q, there is a unique number x where 0 ≤ x < n such that
#    x1 = x mod p, and 
#    x2 = x mod q.
# So any integer x (0 ≤ x < n) can be expressed uniquely in its CRT representation (x1, x2).

# modulus publicExponent privateExponent prime1 prime2  exponent1  exponent2  coefficient


print modulus==(prime1*prime2)

phai_n = (prime1-1) * (prime2-1)

print (publicExponent*privateExponent) % phai_n

print (publicExponent*exponent1) % (prime1-1) 

print (publicExponent*exponent2) % (prime2-1) 

print (coefficient*prime2) % (prime1) 
