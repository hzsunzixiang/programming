
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include "gmp.h"
int main()
{
	mpz_t p;    // 用来加密的大素数
	mpz_t q;    //  p-1 
	mpz_t const_1; // 常数1
	mpz_t pub; //  加密秘钥
	mpz_t pri; //  解密秘钥
	mpz_t secret; // 密文
	mpz_t P; // 明文
	mpz_t Q; // 还原出的明文

	// 必须以NULL结尾 否则 段错误
	mpz_inits (p, q, const_1 ,pub ,pri ,P ,Q ,secret, NULL);

	mpz_set_str (P, "1907", 0); // 明文
	mpz_set_str (p, "2633", 0);  // 加密的大素数
	mpz_set_str (const_1, "1", 0);

	printf("p=: ");
	mpz_out_str(stdout, 10, p);
	printf("\n");

	// p-1
	mpz_sub (q, p, const_1);

	// 选择加密密钥pub 29 和 p-1 互素
	mpz_set_str (pub, "29", 0);  

	//// 求pub=29关于mod p-1 的模逆元  也就是解密密钥 pri
	// 因为是对称加密 所以 不叫公私钥  q = p -1
	if(mpz_invert (pri, pub, q))
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
	mpz_powm(secret, P, pub, p);
	printf("the secret text:");
	mpz_out_str(stdout, 10, secret);
	printf("\n");

	// 解密 出的明文
	mpz_powm(Q, secret, pri, p);
	printf("the decode plain text:");
	mpz_out_str(stdout, 10, Q);
	printf("\n");
}

