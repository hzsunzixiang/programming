
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"
int main()
{
	unsigned long base = 3;
	unsigned long exp = 2333333;
	mpz_t rop;

	mpz_init (rop);
	//mpz_set_str (rop, "666666666661", 0);

	//printf ("Sieving region ["); mpz_out_str (stdout, 10, to);
	//printf("\n");

	//void mpz_pow_ui ( mpz t rop , const mpz t base , unsigned long int exp)
	//void mpz_ui_pow_ui ( mpz t rop , unsigned long int base , unsigned long int exp)
	mpz_ui_pow_ui(rop, base, exp);
	mpz_out_str(stdout, 10, rop);


}

//
//void mpz_powm_sec
//(
// mpz
// t
// rop
// , const mpz
// t
// base
// , const mpz
// t
// exp
// , const
// mpz
// t
// mod
// )
//Set
//rop
//to
//base
//exp
//mod
//mod
//.
//It is required that
//exp
//>
//0 and that
//mod
//is odd.
//This  function  is  designed  to  take  the  same  time  and  have  the  same  cache  access  patterns
//for any two same-size arguments, assuming that function arguments are placed at the same
//position and that the machine state is identical upon function entry.  This function is intended
//for cryptographic purposes, where resilience to side-channel attacks is desired.
//[Function]
//void mpz_pow_ui
//(
// mpz
// t
// rop
// , const mpz
// t
// base
// , unsigned long int
// exp
// )
//[Function]
//void mpz_ui_pow_ui
//(
// mpz
// t
// rop
// , unsigned long int
// base
// , unsigned long int
// exp
// )
