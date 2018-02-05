#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"

// b 模等于 pow(r, a) (mod p)
// 私钥 a  公钥 (p, r, b)
// 由 a 求解 b 容易; 由 b求解a困难
int main()
{
	mpz_t p;    //  选取素数
	mpz_t r;    //  素数的一个原根
	mpz_t a;    //  选取一个整数a 为私钥  满足 0 <= a <= p-1
	mpz_t b;    //  公钥为b  模等于 pow(r, a) (mod p)
	mpz_t P; // 明文
	// 密文为E(P)=  (gammar, delta)
	mpz_t gammar; //
	mpz_t delta; //
	mpz_t Q; // 还原出的明文
	mpz_t tmp;    //  临时变量 

	mpz_inits (p, r, a, b, P, gammar, delta, Q, tmp, NULL);

	unsigned long prime = 2539;
	mpz_set_str (P, "1520", 0);   // 明文
	mpz_set_ui  (p, prime);   // 选取一个素数
	mpz_set_str (r, "2", 0);      // r 位 p 的一个原根 下面验证
	mpz_set_str (a, "14", 0);     // 选取一个整数a 为私钥  满足 0 <= a <= p-1


	gmp_printf("the origin plain text:%Zd\n", P);

	// // 下面 说明 2 是 p 的一个原根
	// // 根据定义 pow(r, phi(p)) 模等于 1 (mod p)
	// // phi(p) = p - 1  
	// // Function: void mpz_powm_ui (mpz_t rop, const mpz_t base, unsigned long int exp, const mpz_t mod)
	// mpz_powm_ui(tmp, r, prime-1, p);  // 此时余数 为1 证明是原根
	// gmp_printf ("the remainder: %Zd\n", tmp);

	// 计算公钥  其中a 为私钥
	mpz_powm(b, r, a, p);

	gmp_printf("the private key:%Zd public key:%Zd\n", a, b); //  1150

	// 所以公钥为 (p, r, b)  = (2539, 2, 1150)

	unsigned long k = 1443; // 选取加密的 随机整数k  1<=l<=p-2

	// (gammar, delta)
	// gammar = pow(r, k) mod p
	mpz_powm_ui(gammar, r, k, p);  // 求gammar部分

	gmp_printf("the part gammar:%Zd\n", gammar);  // 2141

	// delta = P * pow(b, k) mod 2539
	// 先求 P * pow(b, k)
	// Function: void mpz_pow_ui (mpz_t rop, const mpz_t base, unsigned long int exp)
	// Function: void mpz_ui_pow_ui (mpz_t rop, unsigned long int base, unsigned long int exp)

	// 先求 pow(b, k)
	mpz_pow_ui (tmp, b, k);
	// gmp_printf("the pow(b, k):%Zd\n", tmp);   // 很大的数
	// 求 P * pow(b, k)
	mpz_mul(tmp, P, tmp);  // 大素数相乘

	// Function: void mpz_mod (mpz_t r, const mpz_t n, const mpz_t d)
	// Function: unsigned long int mpz_mod_ui (mpz_t r, const mpz_t n, unsigned long int d)

	//再求 delta = P * pow(b, k) mod 2539
	mpz_mod(delta, tmp, p);  // 求delta部分
	gmp_printf("the part delta:%Zd\n", delta);   //  delta  = 216

	// 所以 (gammar, delta) = (2141,216)

	////////////////  下面开始解密   //////////////////////////////

	// Invert 代表求逆元
	//  D(C) = Invert(pow(gammar, a)) * delta (mod p)

	// unsigned long int mpz_get_ui ( const mpz t op)
    // Return the value of op as an unsigned long .
	int ua  = mpz_get_ui(a);
	//1. 先求tmp = pow(gammar, ua)
	mpz_pow_ui (tmp, gammar, ua);
	//2.  Invert(pow(gammar, a)) 
	if(mpz_invert (tmp, tmp, p))  // 求逆元 放到tmp  2452
	{
		gmp_printf("invert exist:%Zd\n", tmp);
	}
	else
	{
		printf("invert not exist:\n");
		exit(1);
	}
	//3.  Invert(pow(gammar, a)) * delta 
	mpz_mul(tmp, tmp, delta);  // 相乘

	//4. D(C) = Invert(pow(gammar, a)) * delta (mod p)
	mpz_mod(Q, tmp, p);  // 求出明文

	gmp_printf("the plain text:%Zd\n", Q);

}

