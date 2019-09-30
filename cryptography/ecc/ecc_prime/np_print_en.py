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

# define the curve E: y^2 = x^3 + 2x + 2 (mod 17)  #E=19
p = 17
a = 2
b = 2

# the primitive point (x1,y1)=(5,1)
x1 = x2 =5
y1 = y2 = 1
print str(1)+"P:\t", (x1, y1)
for i in range(2, 19):
    s = 0
    if (x1 == x2):
        # indentical point
        s = ((3 * (x1 ** 2) + a) * modinv(2 * y1, p))%p
    else:
        # different points
        s = ((y2 - y1) * modinv(x2 - x1, p))%p
    # calculate i.P
    x3 = (s ** 2 - x1 - x2) % p
    y3 = (s*(x1 - x3) - y1) % p
    print str(i) + "P:\t", (x3,y3)
    (x2, y2) = (x3, y3)







