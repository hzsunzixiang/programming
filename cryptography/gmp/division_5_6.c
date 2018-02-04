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
	
	// 3 和 4 同模于 11 结果为 1
	int res = mpz_congruent_p(n, c, d);
	printf ("congruent:%d\n", res);

	// 3 和 5不 同模于 11 结果为 0
	mpz_set_ui(d, 5);
	res = mpz_congruent_p(n, c, d);
	printf ("congruent:%d\n", res);

	res = mpz_congruent_ui_p(n, 3, 4);
	printf ("congruent:%d\n", res);

	//mp_bitcnt_t b;
	//res = mpz_congruent_2exp_p();

//Function: int mpz_congruent_p (const mpz_t n, const mpz_t c, const mpz_t d)
//Function: int mpz_congruent_ui_p (const mpz_t n, unsigned long int c, unsigned long int d)
//Function: int mpz_congruent_2exp_p (const mpz_t n, const mpz_t c, mp_bitcnt_t b)
//
//    Return non-zero if n is congruent to c modulo d, or in the case of mpz_congruent_2exp_p modulo 2^b.
//
//    n is congruent to c mod d if there exists an integer q satisfying n = c + q*d. Unlike the other division functions, d=0 is accepted and following the rule it can be seen that n and c are considered congruent mod 0 only when exactly equal. 
	return 0;
}
