
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"
int main()
{
	mpz_t rop;
	mpz_t op1;
	mpz_t op2;

	mpz_init (rop);
	mpz_init (op1);
	mpz_init (op2);

	//mpz_set_str (rop, "666666666661", 0);
	mpz_set_str (op1, "13", 0);
	mpz_set_str (op2, "2436", 0);

	//printf ("Sieving region ["); mpz_out_str (stdout, 10, to);
	//printf("\n");

	// 求模逆元
	// int mpz_invert ( mpz t rop , const mpz t op1 , const mpz t op2)
	// Compute the inverse of op1 modulo op2 and put the result in rop .
	// If the inverse exists, the return value is non-zero and rop will satisfy

	if(mpz_invert (rop , op1, op2))
	{
		printf("exist:");
		mpz_out_str(stdout, 10, rop);
	}
	else
	{
		printf("not exist:\n");
	}

	//	void mpq_add ( mpq t sum , const mpq t addend1 , const mpq t addend2) 
	//	Set sum to addend1 + addend2 .  [Function]
	//	void mpq_sub ( mpq t difference , const mpq t minuend , const mpq t subtrahend)
	//	Set difference to minuend _n 
	//void mpq_mul ( mpq t product , const mpq t multiplier , const mpq t multiplicand)
	//printf ("Sieving region ["); mpz_out_str (stdout, 10, to);
	//printf("\n");
	// void mpz_powm ( mpz t rop , const mpz t base , const mpz t exp , const mpz t mod)
	// void mpz_powm_ui ( mpz t rop , const mpz t base , unsigned long int exp , const mpz t mod)

	// 求模逆元
	// int mpz_invert ( mpz t rop , const mpz t op1 , const mpz t op2)
	// Compute the inverse of op1 modulo op2 and put the result in rop .
	// If the inverse exists, the return value is non-zero and rop will satisfy

}

