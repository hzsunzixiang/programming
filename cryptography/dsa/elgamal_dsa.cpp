#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"

// ElGamal signature scheme

// 用私钥a 计算 (gammar, s)
/*
   过程如下
   1. 前提说明 
   		公钥(p, r, b) 私钥 a, 其中 b 模等于 pow(r,a) (mod p)
		P 为H(m) 一般为 SHA1
   2. 选取整数k 满足 (k, p-1) = 1 计算 gammar 和 s

   3, 计算 (gammar, s)对 
       gamma 模等于 pow(r, k) (mod p)
       s     模等于 (P - a*gammar) * k的逆   (mod p-1)   注意这里是关于 p - 1的逆

   4. 使用公钥 (p, r, b) 验证 V1 = V2
       V1 模等于 pow(gammar, s) * pow(b, gammar) (mod p)
	   V2 模等于 pow(r, P) (mod p)
*/

int main()
{
	mpz_t p;    //  选取素数
	mpz_t r;    //  素数的一个原根
	mpz_t a;    //  选取一个整数a 为私钥  满足 0 <= a <= p-1
	mpz_t b;    //  公钥为b  模等于 pow(r, a) (mod p)
	mpz_t P; // 明文
	// 签名为 (gammar, s)
	mpz_t gammar; //
	mpz_t s; //
	mpz_t V1; //  用公钥计算的部分
	mpz_t V2;  // 用明文计算的部分 
	mpz_t tmp;    //  临时变量 
	mpz_t tmp2;    //  临时变量 
	mpz_t tmp3;    //  临时变量 

	mpz_inits (p, r, a, b, P, gammar, s, V1, V2, tmp, tmp2, tmp3, NULL);

	unsigned long prime = 2539;
	mpz_set_str (P, "111", 0);   // 明文  需要签名的信息。 实际是 摘要 SHA1
	mpz_set_ui  (p, prime);   // 选取一个素数
	mpz_set_str (r, "2", 0);      // r 位 p 的一个原根 下面验证
	mpz_set_str (a, "14", 0);     // 选取一个整数a 为私钥  满足 0 <= a <= p-1

	gmp_printf("the origin plain text:%Zd\n", P);

	// 计算公钥  其中a 为私钥
	mpz_powm(b, r, a, p);

	gmp_printf("the private key:%Zd public key:%Zd\n", a, b); //  1150

	// 所以公钥为 (p, r, b)  = (2539, 2, 1150)

	unsigned long k = 457; // 随机选取整数k  1<=l<=p-2

	// (gammar, s)
	// gammar = pow(r, k) mod p
	mpz_powm_ui(gammar, r, k, p);  // 求gammar部分

	gmp_printf("the part gammar:%Zd\n", gammar);  //  1079

	///// 下面求 (gammar, s) 中的另一部分 s
    //  s     模等于 (P - a*gammar) * k的逆   (mod p-1)
	// 1. 求 (P - a*gammar)
	// 1.1 求 a*gammar
	mpz_mul(tmp, a, gammar);  

	// 1.2 求  (P - a*gammar)

	mpz_sub(tmp, P, tmp);  
	gmp_printf("tmp = (P - a*gammar):%Zd\n", tmp);
	// 2. 求k关于模p的逆
	mpz_set_ui(tmp2, k);  // tmp2 存放k的对象指针

	// void mpf_sub_ui ( mpf t rop , const mpf t op1 , unsigned long int op2)
	// void mpz_set ( mpz t rop , const mpz t op)
	mpz_set(tmp3, p);
	mpz_sub_ui(tmp3, tmp3, 1);  // tmp3 中存放着 p - 1
	if(mpz_invert (tmp2, tmp2, tmp3))  // 求k关于 p-1 的逆元 放到tmp2   2227
	{
		gmp_printf("invert exist:%Zd\n", tmp2);
	}
	else
	{
		printf("invert not exist:\n");
		exit(1);
	}

	// 3. 求(P - a*gammar) * (k的逆)
	mpz_mul(tmp, tmp, tmp2);

	// 4. 求 (P - a*gammar) * (k的逆)  (mod p-1)
	mpz_mod(s, tmp, tmp3);  // tmp3 中存放着 p - 1
	gmp_printf("s:%Zd\n", s); // 1139
	// (gammar, s) = (1079, 1139)


    ////////////////////////////////
    // 开始验证

	//   使用公钥 (p, r, b) 验证 V1 = V2
	//   V1 模等于 pow(gammar, s) * pow(b, gammar) (mod p)
	//   1. 计算 pow(gammar, s) 
	unsigned long s_tmp = mpz_get_ui(s);
	mpz_pow_ui(tmp, gammar, s_tmp);
	
	//   2. 计算 pow(b, gammar) 
	unsigned long gammar_tmp = mpz_get_ui(gammar);
	mpz_pow_ui(tmp2, b, gammar_tmp);
	//   3. 计算 pow(gammar, s) * pow(b, gammar) 
	mpz_mul(tmp, tmp, tmp2);

	//   4. 计算 pow(gammar, s) * pow(b, gammar) (mod p)
	mpz_mod(V1, tmp, p);
	gmp_printf("V1:%Zd\n", V1);  // 1158


	//   V2 模等于 pow(r, P) (mod p)
	//  1. 计算 pow(r, P)
	unsigned long P_tmp = mpz_get_ui(P);
	mpz_pow_ui(tmp, r, P_tmp);
	
    //  2. 计算 pow(r, P) (mod p)
	mpz_mod(V2, tmp, p);

	gmp_printf("V2:%Zd\n", V2);  // 1158

	// int mpz_cmp ( const mpz t op1 , const mpz t op2)
	if(mpz_cmp(V1, V2) == 0)
	{
		gmp_printf("signature is correct, V1:%Zd, V2:%Zd \n", V1, V2);
	}
	else
	{
		gmp_printf("signature is wrong, V1:%Zd, V2:%Zd \n", V1, V2);
	}
}

