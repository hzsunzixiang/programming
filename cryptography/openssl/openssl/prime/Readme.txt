StephenSun@debian-1:~/programming/cryptography/openssl/openssl/prime$ openssl prime  7
7 is prime
StephenSun@debian-1:~/programming/cryptography/openssl/openssl/prime$ openssl prime  10
A is not prime
StephenSun@debian-1:~/programming/cryptography/openssl/openssl/prime$ openssl prime  10999999999
28FA6ADFF is prime

StephenSun@debian-1:~/programming/cryptography/openssl/openssl/prime$ openssl prime  -hex 10999999999
10999999999 is not prime
StephenSun@debian-1:~/programming/cryptography/openssl/openssl/prime$ openssl prime  -hex 1e999999999
1E999999999 is not prime


https://stackoverflow.com/questions/19732162/generate-prime-number-using-openssl

OpenSSL version 1.0.0 and newer adds -generate option to the prime command:

StephenSun@debian-1:~/programming/cryptography/openssl/openssl/prime$ openssl prime -generate -bits 2048 -hex
DC7F8562BB451DEE8DBED5F3521F184575A27D79E107B169A06CB305DD6C7521F5D1D762976276EE94444B945EFBAD54A36D3985326DE3B6194AA5C3DE5AE897309C873C648F878FAFA8D2F122E082FBD703DEC78E5E118FCAF53F599121536D2677EF32BAF99DE7EE2B1E52BEE1E2A95E3FC6A916361DF66C707E1835E006D052C7E200ACB15E9C5574310269B7BB48D5294B4D24F2E4FAED4840E0AAFBDBC4AC8FDE8EE0E55E7FA580BF2309BE5681F2C2B2ECB5FD9005E5FD2B9A9A496F6D8703F9391E68BD7F7D19055902952B0F073B4C77BB0153EA3DDEBE916D608C1D3397CA0657250D629C7941F2C12C1EA090CCF07AEB323C108948C8EA148DCB57
