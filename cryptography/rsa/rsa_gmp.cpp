
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"
int main()
{
	mpz_t p;    // 第一个大素数
	mpz_t q;    //  第二个大素数
	mpz_t n;    // 大素数乘积
	mpz_t phai_p; // p的欧拉函数
	mpz_t phai_q; // q的欧拉函数
	mpz_t phai_n; // n的欧拉函数
	mpz_t const_1; // 常数1
	mpz_t pub; // 公钥
	mpz_t pri; // 私钥
	mpz_t secret; // 密文
	mpz_t P; // 明文
	mpz_t Q; // 还原出的明文

	//mpz_inits (p, q ,n ,phai_p ,phai_q ,phai_n ,const_1 ,pub ,pri ,P ,Q ,secret);
	//void mpz_inits ( mpz t x , ...)
	//	Initialize a NULL-terminated list of mpz_t variables, and set their values to 0.
	// 必须以NULL结尾 否则 段错误
	mpz_inits (p, q ,n ,phai_p ,phai_q ,phai_n ,const_1 ,pub ,pri ,P ,Q ,secret, NULL);

	mpz_set_str (P, "1520", 0); // 明文
	mpz_set_str (p, "43", 0);
	mpz_set_str (q, "59", 0);
	mpz_set_str (const_1, "1", 0);
	mpz_mul(n, p, q);  // 大素数相乘
	printf("n=: ");
	mpz_out_str(stdout, 10, n);
	printf("\n");

	mpz_sub (phai_p, p, const_1);
	mpz_sub (phai_q, q, const_1);
	mpz_mul(phai_n, phai_p, phai_q); // phai_n

	printf("phai_p=: ");
	mpz_out_str(stdout, 10, phai_p);
	printf("\n");

	printf("phai_q=: ");
	mpz_out_str(stdout, 10, phai_q);
	printf("\n");


	// 选择公钥 13 和 phai_n 互素
	mpz_set_str (pub, "13", 0);  

	// 求13 关于mod phai_n 的模逆元  也就是私钥 pri
	if(mpz_invert (pri, pub, phai_n))
	{
		printf("private exist:");
		mpz_out_str(stdout, 10, pri);
		printf("\n");
	}
	else
	{
		printf("private not exist:\n");
		exit(1);
	}
	// 对数据加密
	printf("the plain text:");
	mpz_out_str(stdout, 10, P);
	printf("\n");

	// 密文
	mpz_powm(secret, P, pub, n);
	printf("the secret text:");
	mpz_out_str(stdout, 10, secret);
	printf("\n");


	// 解密 出的明文
	mpz_powm(Q, secret, pri, n);
	printf("the decode plain text:");
	mpz_out_str(stdout, 10, Q);
	printf("\n");

}

