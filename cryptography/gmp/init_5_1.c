#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"

	int
main (void)
{
	mpz_t  r, n;
	//  brk(0)                                  = 0x1939000
	// brk(0x195a000)                          = 0x195a000


	// 调用brk分配内存
	// Function: void mpz_init (mpz_t x)
	// 
	//     Initialize x, and set its value to 0. 

	//mpz_init (r);

	// Function: void mpz_inits (mpz_t x, ...)
	// 
	//     Initialize a NULL-terminated list of mpz_t variables, and set their values to 0. 

	mpz_inits (r, n, NULL);

	mpz_init_set_str (n, "123456", 0);

	gmp_printf ("%Zd\n", r);

	// Function: void mpz_clears (mpz_t x, ...)
	// Free the space occupied by a NULL-terminated list of mpz_t variables. 
    // 没有追踪到free 
	mpz_clears(r, n, NULL);
	///mpz_clear(r);
	return 0;
}
