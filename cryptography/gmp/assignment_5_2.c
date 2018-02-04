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

	mpz_inits (r, n, NULL);

// Function: void mpz_set (mpz_t rop, const mpz_t op)
// Function: void mpz_set_ui (mpz_t rop, unsigned long int op)
// Function: void mpz_set_si (mpz_t rop, signed long int op)
// Function: void mpz_set_d (mpz_t rop, double op)
// Function: void mpz_set_q (mpz_t rop, const mpq_t op)
// Function: void mpz_set_f (mpz_t rop, const mpf_t op)

	//mpz_set_ui(r, -987654321); // 如果是负数 将会是另一个无符号数字
	mpz_set_ui(r, 987654321);
	gmp_printf ("mpz_set_ui %Zd\n", r);

	mpz_set_si(r, -987654321);
	gmp_printf ("mpz_set_si %Zd\n", r);
// Function: int mpz_set_str (mpz_t rop, const char *str, int base)
	mpz_init_set_str (n, "123456", 0);

	gmp_printf ("mpz_init_set_str %Zd\n", n);

// Function: void mpz_swap (mpz_t rop1, mpz_t rop2)
	mpz_swap(r, n);
	gmp_printf ("mpz_swap %Zd\n", n);

	mpz_init_set_str (n, "123456", 0);

/////////////////////////////////////////////////////////
// 5.3 Combined Initialization and Assignment Functions
    mpz_t pie;
    // 如果直接使用不初始化 会段错误  因为还没分配内存
	// mpz_set_ui(pie, 3145678);
    mpz_init_set_str (pie, "3141592653589793238462643383279502884", 10);

	gmp_printf ("mpz_init_set_str%Zd\n", pie);


// Function: void mpz_init_set (mpz_t rop, const mpz_t op)
// Function: void mpz_init_set_ui (mpz_t rop, unsigned long int op)
// Function: void mpz_init_set_si (mpz_t rop, signed long int op)
// Function: void mpz_init_set_d (mpz_t rop, double op)



	mpz_clears(r, n, NULL);
	return 0;
}
