

Diffie-Hellman 算法本身很简单就是离散对数
关键看其中命令行使用

dh

Diffie-Hellman Parameter Management. Obsoleted by dhparam.

dh命令过时了 用dhparam 代替

gendh命令 是一样的 不一样的地方在于gendh 只能用来生成不能用来显示明文


StephenSun@debian-1:~/programming/cryptography/openssl/openssl/dh$ openssl dhparam -outform PEM -out dhparam.pem 1024
Generating DH parameters, 1024 bit long safe prime, generator 2
This is going to take a long time

# 生成C代码
StephenSun@debian-1:~/programming/cryptography/openssl/openssl/dh$ openssl  dhparam  -C -in dhparam.pem  > dhparam.c
StephenSun@debian-1:~/programming/cryptography/openssl/openssl/dh$ openssl  dhparam  -text -in dhparam.pem                      
    PKCS#3 DH Parameters: (1024 bit)
        prime:
            00:e4:72:b1:cf:d2:9e:2a:3f:00:c2:27:93:ec:4b:
            b9:14:34:d2:cf:0f:ba:3f:b8:b2:e7:26:d3:7c:ca:
            81:16:82:0b:77:57:ef:3a:1a:0c:73:7a:f2:76:7a:
            33:8e:40:19:c3:d0:6c:e4:e6:bf:45:89:22:2f:70:
            f7:66:10:08:63:a3:7f:ed:25:97:18:51:79:6e:dc:
            13:c5:cf:4d:30:41:6c:d8:33:83:54:24:b7:07:14:
            7a:7e:46:a6:c7:c9:93:0d:0a:5f:8d:86:4e:74:d8:
            ab:59:b5:d0:62:6f:c9:60:b4:26:4c:60:9a:fb:e4:
            7a:18:7b:7b:8e:c0:f9:e6:0b
        generator: 2 (0x2)
-----BEGIN DH PARAMETERS-----
MIGHAoGBAORysc/Snio/AMInk+xLuRQ00s8Puj+4sucm03zKgRaCC3dX7zoaDHN6
8nZ6M45AGcPQbOTmv0WJIi9w92YQCGOjf+0llxhReW7cE8XPTTBBbNgzg1QktwcU
en5GpsfJkw0KX42GTnTYq1m10GJvyWC0Jkxgmvvkehh7e47A+eYLAgEC
-----END DH PARAMETERS-----



#-5            generate parameters using  5 as the generator value

StephenSun@debian-1:~/programming/cryptography/openssl/openssl/dhparam$ openssl dhparam -5 -outform PEM -out dhparam-5.pem 1024
Generating DH parameters, 1024 bit long safe prime, generator 5
This is going to take a long time
....

StephenSun@debian-1:~/programming/cryptography/openssl/openssl/dhparam$ openssl  dhparam  -text -in dhparam-5.pem
    PKCS#3 DH Parameters: (1024 bit)
        prime:
            00:a3:61:e5:ff:e6:6a:15:7b:f7:45:1f:eb:de:25:
            30:6f:67:81:88:88:fc:f6:81:4b:cf:74:08:8a:2e:
            4c:8b:03:05:9b:a0:bd:e7:28:a9:69:33:dc:24:e1:
            18:19:74:8d:ec:fb:9b:1c:e9:da:09:50:d8:43:72:
            d8:c5:57:71:53:b5:9e:62:a6:35:53:29:8b:f7:2c:
            c9:41:75:dd:73:cc:06:6c:d3:d6:42:77:88:fc:e0:
            a8:d5:ed:6c:84:f5:b0:fa:b6:30:70:f1:e1:2d:31:
            7b:7d:93:d6:5d:f3:29:69:51:bd:0a:c9:0d:26:ce:
            17:c5:fc:bb:02:77:bf:c1:7f
        generator: 5 (0x5)
-----BEGIN DH PARAMETERS-----
MIGHAoGBAKNh5f/mahV790Uf694lMG9ngYiI/PaBS890CIouTIsDBZugvecoqWkz
3CThGBl0jez7mxzp2glQ2ENy2MVXcVO1nmKmNVMpi/csyUF13XPMBmzT1kJ3iPzg
qNXtbIT1sPq2MHDx4S0xe32T1l3zKWlRvQrJDSbOF8X8uwJ3v8F/AgEF
-----END DH PARAMETERS-----

# gendh 命令一样的作用
StephenSun@debian-1:~/programming/cryptography/openssl/openssl/dhparam$ openssl  gendh  -out test.pem -5
Generating DH parameters, 2048 bit long safe prime, generator 5
This is going to take a long time
...

#http://h41379.www4.hpe.com/doc/83final/ba554_90007/ch06s06.html


In order to establish an SSL connection with the DH (key exchange) and DSA (DSS, signing) algorithms, a DH parameter file and DSA certificates and keys are required in your SSL application. The Certificate Tool (described in Chapter 3) does not provide this functionality. However, the OpenSSL command-line utility allows you to create the required files.

The following lines demonstrate how to create the DH and DSA related files.

# https://security.stackexchange.com/questions/94390/whats-the-purpose-of-dh-parameters
What exactly is the purpose of these DH Parameters?

These parameters define how OpenSSL performs the Diffie-Hellman (DH) key-exchange. As you stated correctly they include a field prime p and a generator g. The purpose of the availability to customize these parameter is to allow everyone to use his / her own parameters for this. This can be used to prevent being affected from the Logjam attack (which doesn't really apply to 4096 bit field primes).
So what do they define?
A Diffie-Hellman key exchange operates as follows:

The server Bob uses these parameters to calculate B=g^b mod p. He sends (B,g,p) to the client Alice who computes A=g^a mod p on her own along with K=B^a mod p. She sends A to Bob and he computes K=A^b mod p. As A^b=g^(a*b)=g^(b*a)=B^a mod p holds both parties will agree on a shared key. The parameters p and g define the security of this key-exchange. A larger p will make finding the shared secret K a lot harder, defending against passive attackers.

And why do you have to pre-compute them?
Finding the prime p means finding a value for p for which p=2q+1 holds, with q being a prime. p is then called a safe prime.
Finding such primes is really computational intense and can't be afforded on each connection, so they're pre-computed.

Can they be public?

Yes, it's no risk publishing them. In fact they're sent out for every key-exchange that involves some Diffie-Hellman (DH) key exchange. There are even a few such parameters standardized for example in RFC 5114. The only possible problems with publishing may be that a powerful attacker may be interested in performing some computations on them, enabling him to perform the Logjam attack. However as your parameters use a 4096 bit field prime p this isn't a risk.
To explain why publishing them isn't a risk you may want to take a look at the above key-exchange description and note that the parameters are only used as a base for the computations but all the secrets (a,b) are completely independent of g,p.

