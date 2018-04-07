#!/usr/bin/env python
# -*- coding:UTF-8



# Python 3 program to find modular 
# inverse of a under modulo m

# A naive method to find modulor 
# multiplicative inverse of 'a' 
# under modulo 'm'
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

# Driver Program
a = 2
m = 17
print(modinv(a, m))

#This code is contributed by Nikita Tiwari.

# https://eng.paxos.com/blockchain-101-foundational-math
# p是素数时 根据费马小定理来求逆元  不是素数不行
#Notice that we end up with the same result as before for ⅔. Incidentally, if you’re using python, there’s a very convenient function called “pow” which does modulo exponentiation:
#Python: n^(-1) = pow(n, p-2, p)

print pow(a, m-2, m)




