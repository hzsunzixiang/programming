

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
 


def rsa_alg():
    P = 1520   # the text 
    p = 43
    q = 59
    n = 43*59
    pha_n = 42*58
    e = 13   # public
    d = modInverse(13, pha_n)  # priv
    print(modInverse(13, pha_n));
    
    C=(1520**13) % n  # secret 
    print(C)
    T = C**d % n  # recover text
    print(T)
 

## Driver Program
#a = 3
#m = 11
#print(modInverse(a, m))

rsa_alg()
#This code is contributed by Nikita Tiwari.
