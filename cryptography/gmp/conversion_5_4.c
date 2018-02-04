#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"

	int
main (void)
{
	mpz_t  r, n, c;

	mpz_inits (r, n, c, NULL);

	mpz_init_set_str (c, "123456", 0);

	gmp_printf ("%Zd\n", c);


	mpz_set_str (n, "12345678987654321234567899876543212345678987654321", 0);
// Function: char * mpz_get_str (char *str, int base, const mpz_t op)

//    Convert op to a string of digits in base base. The base argument may vary from 2 to 62 or from -2 to -36. 

//For base in the range 2..36, digits and lower-case letters are used; for -2..-36, digits and upper-case letters are used; for 37..62, digits, upper-case letters, and lower-case letters (in that significance order) are used. 
	char str[10240];
    //mpz_get_str (str, 10, n);
    //mpz_get_str (str, 36, n);
    //mpz_get_str (str, -36, n);
    mpz_get_str (str, 50, n);


    printf("str:%s\n", str);


//Function: unsigned long int mpz_get_ui (const mpz_t op)
//    Return the value of op as an unsigned long. 

	printf("mpz_get_ui:%ld\n", mpz_get_ui(n));

//Function: signed long int mpz_get_si (const mpz_t op)
//Function: double mpz_get_d (const mpz_t op)
// Function: double mpz_get_d_2exp (signed long int *exp, const mpz_t op) 
	mpz_set_str (n, "128", 0);
    long int exp = 2;
	double res = mpz_get_d_2exp(&exp, n);
	printf("mpz_get_d_2exp:%lf, exp:%ld\n", res, exp);
	// mpz_get_d_2exp:0.500000, exp:8

    // 和预期不太一样 [0.5, 1)
    // mpz_get_d_2exp:0.843750, exp:5
    exp = 3;
	mpz_set_str (n, "27", 0);
	res = mpz_get_d_2exp(&exp, n);
	printf("mpz_get_d_2exp:%lf, exp:%ld\n", res, exp);
	mpz_clears(r, n, NULL);
	return 0;
}
