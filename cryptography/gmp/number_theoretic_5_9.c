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

//Function: int mpz_invert (mpz_t rop, const mpz_t op1, const mpz_t op2)
//
//    Compute the inverse of op1 modulo op2 and put the result in rop. If the inverse exists, the return value is non-zero and rop will satisfy 0 <= rop < abs(op2) (with rop = 0 possible only when abs(op2) = 1, i.e., in the somewhat degenerate zero ring). If an inverse doesn’t exist the return value is zero and rop is undefined. The behaviour of this function is undefined when op2 is zero. 
//
	if(mpz_invert (d, c, n))
	{
		printf("exist:");
		//mpz_out_str(stdout, 10, d);
	    gmp_printf ("inverse: %Zd\n", d);
	}
	else
	{
		printf("not exist:\n");
	}

	mpz_set_ui(n, 3);
	mpz_set_ui(c, 6);

	if(mpz_invert (d, c, n))
	{
		printf("exist:");
		//mpz_out_str(stdout, 10, d);
	    gmp_printf ("inverse: %Zd\n", d);
	}
	else
	{
		printf("not exist:\n");
	}

//Function: void mpz_gcd (mpz_t rop, const mpz_t op1, const mpz_t op2)
//
//    Set rop to the greatest common divisor of op1 and op2. The result is always positive even if one or both input operands are negative. Except if both inputs are zero; then this function defines gcd(0,0) = 0. 

	mpz_set_str (c, "1111118889899993366111111111111111777777777777777777777777777777777777777777777777777777777776", 0);
	mpz_set_str (d, "2222227299992222222222222236789876999999999999999999999999999999999999999999999999999999966668", 0);
	mpz_gcd(n, c, d);
	gmp_printf("gcd: %Zd\n", n);

//Function: unsigned long int mpz_gcd_ui (mpz_t rop, const mpz_t op1, unsigned long int op2)
	unsigned long res = mpz_gcd_ui(n, c, 777777790);
	gmp_printf("gcd: %lu\n", res);

// Function: void mpz_fib_ui (mpz_t fn, unsigned long int n)
// Function: void mpz_fib2_ui (mpz_t fn, mpz_t fnsub1, unsigned long int n)
	mpz_fib_ui(n, 10);
	//mpz_fib_ui(n, 100000000);
    // StephenSun@debian-1:~/programming/cryptography/gmp$ wc xx.txt 
    // 1        2 20898770 xx.txt
	gmp_printf("fib: %Zd\n", n);

	mpz_fib2_ui(n, c, 10);
	gmp_printf("fib: n:%Zd, n-1:%Zd\n", n, c);



// Function: void mpz_primorial_ui (mpz_t rop, unsigned long int n)
//     Set rop to the primorial of n, i.e. the product of all positive prime numbers <=n. 
	//mpz_set_str (n, "2", 0);
     // 没看明白
	mpz_primorial_ui(n, 8);
	gmp_printf("mpz_primorial_ui:%Zd\n", n);

//Function: int mpz_probab_prime_p (const mpz_t n, int reps)
// Determine whether n is prime. Return 2 if n is definitely prime, return 1 if n is probably prime (without being certain), or return 0 if n is definitely non-prime. 

	//mpz_set_str (n, "11111188898999933661111111111111117777777777777777777777777777777777777777777777777777777777755511111", 0);
	mpz_set_str (n, "97", 0);
	res = mpz_probab_prime_p(n, 15); 
	gmp_printf("mpz_probab_prime_p:%d\n", res);

///Function: void mpz_nextprime (mpz_t rop, const mpz_t op)
	mpz_set_str (n, "97", 0);
	mpz_nextprime(c, n); 
	gmp_printf("mpz_probab_prime_p:%Zd\n", c);
//

// Function: void mpz_lcm (mpz_t rop, const mpz_t op1, const mpz_t op2)
// Function: void mpz_lcm_ui (mpz_t rop, const mpz_t op1, unsigned long op2)
	mpz_set_str (c, "9773", 0);
	mpz_set_str (d, "971", 0);
	mpz_lcm(n, c, d); 
	gmp_printf("mpz_lcm:%Zd\n", n);

	mpz_lcm_ui(n, c, 11); 
	gmp_printf("mpz_lcm_ui:%Zd\n", n);

	return 0;
}
