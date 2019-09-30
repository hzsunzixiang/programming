#!/usr/bin/env python
# -*- coding:UTF-8

# Extended Euclidean algorithm 
def extended_gcd(aa, bb):
    lastremainder, remainder = abs(aa), abs(bb)
    x, lastx, y, lasty = 0, 1, 1, 0
    while remainder:
        lastremainder, (quotient, remainder) = remainder, divmod(lastremainder, remainder)
        x, lastx = lastx - quotient*x, x
        y, lasty = lasty - quotient*y, y
    return lastremainder, lastx * (-1 if aa < 0 else 1), lasty * (-1 if bb < 0 else 1)
 
# calculate `modular inverse`
def modinv(a, m):
    g, x, y = extended_gcd(a, m)
    if g != 1:
    	raise ValueError
    return x % m

# define the curve E: y^2 = x^3 + x  (mod 257)  #E=19
p = 257 
a = 1
b = 0

P=(1, 60)  # point P 
Q=(15, 7)  # point Q
def nPlusm(P, Q):
    x1 = P[0]
    y1 = P[1]
    x2 = Q[0]
    y2 = Q[1]
    s = 0
    if (x1 == x2):
        s = ((3 * (x1**2) + a) * modinv(2*y1, p))%p
    else:
        # x1 != x2 
        s = ((y2-y1) * modinv(x2-x1, p))%p
    x3=(s**2 - x1 - x2)%p
    y3=(s*(x1-x3) - y1)%p
    return (x3, y3)

print "P(1, 60) + Q(15, 7) = %s"%(nPlusm(P, Q), )

