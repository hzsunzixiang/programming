


##1. As shown in https://crypto.stackexchange.com/questions/31807/why-does-my-ssh-private-key-still-work-after-changing-some-bytes-in-the-file
The answer says:
>To speed up exponentiation modulo $n$ by a factor of about $4$, the [Chinese Remainder Theorem](https://en.wikipedia.org/wiki/RSA_(cryptosystem)#Using_the_Chinese_remainder_algorithm) can be utilized to compute the result modulo $p$ and $q$ separately and subsequently combine them to obtain the "real" result modulo $n$.

##2. Then I read the wiki [Chinese Remainder Theorem](https://en.wikipedia.org/wiki/RSA_(cryptosystem)#Using_the_Chinese_remainder_algorithm)


>###  Using the Chinese remainder algorithm 

>For efficiency many popular crypto libraries use the following optimization for decryption and signing based on the [Chinese remainder theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem). The following values are precomputed and stored as part of the private key:
>
* $p$  and  $q$: the primes from the key generation,        
* $d_P = d \pmod{p - 1}$,        
* $d_Q = d \pmod{q - 1}$ and       
* $q_\text{inv} = q^{-1} \pmod{p}$.        

>These values allow the recipient to compute the exponentiation $m=c^d \pmod{pq}$ more efficiently as follows:   
>     
* $m_1 = c^{d_P} \pmod{p}$        
* $m_2 = c^{d_Q} \pmod{q}$        
* $h = q_\text{inv}(m_1 - m_2) \pmod{p}$ (if $m_1 < m_2$ then some libraries compute $h$ as $q_\text{inv}\left[\left(m_1 + \left\lceil \frac{q}{p} \right\rceil p\right) - m_2\right] \pmod{p}$)        
* $m = m_2 + hq\,$    
>    
This is more efficient than computing [[exponentiation by squaring]] even though two modular exponentiations have to be computed. The reason is that these two modular exponentiations both use a smaller exponent and a smaller modulus.

## My question is：
###1. How the equation is proved? I want to know more details.    
$m = m_2 + hq\,$   
###2. Should the equation be:     
$m \equiv m_2 + hq\, \pmod {n}$


Speed up the calculation of RSA using Chinese Remainder Theorem
