

#include <stdio.h>

#include "gmp.h"
int main()
{
	mpz_t p;       // The first prime
    // initialize  the big number
	mpz_inits (p, NULL);

	mpz_set_str (p, "0x00ed6aead4012490897cc99074d534488d8cd85ecd0839fb6b1e12bd7a6a7849431a5aef1938e97b3cdeedfbd1166fa044c2785a1838bf1e71d88ff3009d1aac5f74756d1b3742e2931249e42b60f993d934df85d5bbd64e2dcb726e80a692b628f544549a15a4c85655c27a26ca144db403a27137fde1a9cdb8f46e8f677d1ecd", 0);
	// you can print the big num by function  `mpz_out_str`
	printf("n=: ");
	mpz_out_str(stdout, 10, p);
	printf("\n");
}

