#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"

	int
main (void)
{
	mpz_t  n, c, d;

	mpz_inits (n, c, d, NULL);

	mpz_set_str (n, "11", 0);
	mpz_set_ui(c, 3);
	mpz_set_ui(d, 4);


//Function: void mpz_pow_ui (mpz_t rop, const mpz_t base, unsigned long int exp)
//Function: void mpz_ui_pow_ui (mpz_t rop, unsigned long int base, unsigned long int exp)
	mpz_ui_pow_ui(n, 9, 6);
	mpz_out_str(stdout, 10, n);
	printf("\n");

	mpz_pow_ui(n, c, 5);
	mpz_out_str(stdout, 10, n);
	printf("\n");

//Function: void mpz_powm (mpz_t rop, const mpz_t base, const mpz_t exp, const mpz_t mod)
//Function: void mpz_powm_ui (mpz_t rop, const mpz_t base, unsigned long int exp, const mpz_t mod)
//    Set rop to (base raised to exp) modulo mod. 

	mpz_t mod;
	mpz_init_set_ui(mod, 11);
	mpz_set_ui(n, 3);
	mpz_set_ui(d, 4);
	mpz_powm(n, c, d, mod);
	gmp_printf ("pow(%Zd, %Zd) %% %Zd = %Zd\n", c, d, mod, n);

	unsigned long int exp = 6;
	mpz_powm_ui(n, c, exp, mod);

	gmp_printf ("pow(%Zd, %ld) %% %Zd = %Zd\n", c, exp, mod, n);

// 没看明白下面这句
// Negative exp is supported if an inverse base^-1 mod mod exists (see mpz_invert in Number Theoretic Functions). If an inverse doesn’t exist then a divide by zero is raised
// 如果 base 的模逆元 模mod 不 存在
	
	//exp = 6;
	//mpz_set_ui(c, 6);
	//mpz_powm_ui(n, c, exp, mod);
	//mpz_set_ui(mod, 12);

	//gmp_printf ("pow(%Zd, %ld) %% %Zd = %Zd\n", c, exp, mod, n);
	return 0;
}
