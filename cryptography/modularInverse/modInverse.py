#!/usr/bin/env python
# -*- coding:UTF-8



# Python 3 program to find modular 
# inverse of a under modulo m

# A naive method to find modulor 
# multiplicative inverse of 'a' 
# under modulo 'm'
def modInverse(a, m) :
    a = a % m;
    for x in range(1, m) :
        if ((a * x) % m == 1) :
            return x
    return 1

# Driver Program
a = 2
m = 17
print(modInverse(a, m))

#This code is contributed by Nikita Tiwari.

# https://eng.paxos.com/blockchain-101-foundational-math
# p是素数时 根据费马小定理来求逆元  不是素数不行
#Notice that we end up with the same result as before for ⅔. Incidentally, if you’re using python, there’s a very convenient function called “pow” which does modulo exponentiation:
#Python: n^(-1) = pow(n, p-2, p)

print pow(a, m-2, m)




