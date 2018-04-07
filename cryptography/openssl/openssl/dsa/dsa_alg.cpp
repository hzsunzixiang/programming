
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>
#include "gmp.h"
int main()
{
	mpz_t P;    // 素数
	mpz_t Q;    // Q个元素的子群 
	mpz_t G;    // 生成元
	mpz_t pub;  // 公钥
	mpz_t priv; // 私钥
	mpz_t tmp; // 私钥

	//	Initialize a NULL-terminated list of mpz_t variables, and set their values to 0.
	// 必须以NULL结尾 否则 段错误
	mpz_inits (P ,Q, G, pub, priv,  tmp, NULL);

	mpz_set_str (P, "0x00e79d25ca547dc8931850eaaa6784e365eecf69374243d902c12df7d4896a9e5b8717c4c7b24e30d1b468061838f5bc76df050ef6b7c58105ee2cf23ecb67e7d89830a0976f606e194d0b85e6566cca6275b7b184416337fc7ac37bebe9c9f76e982b9a82ee0a904900a0a7f76f4760e76120ecd2732a1dfe9a1dfa568757690670460688205a7e0d744feacdc27416a27afe5233dd58945801af83c7fd7199dcbed00819750c81cd3f2b5d68c29cd43e035eed70bfd85f55259df953f4f69d719ebe5c06b3443d249b110e602d81366ea88407ed81d3cf6f6fcea1bb7f9af563d2ca436d5c2d794f06407d1f111cb25a86f7568368e085ebe31f7eb8b9bedb89", 0); //  初始化素数
	mpz_set_str (Q, "0x00c39250922561c4b56a9c1bfb0d523bbfe8395182c5464b38a1d9959aa121871b", 0); // 初始化子群个数
	mpz_set_str (G, "0x6cde6920c61fa80e51212de15be6b2aca93174e3fd5d479d08affb57222370c9047b099ea9e9d53b694915967709580b77a5cfd70629e1308c9db7a9e8c2f41f3c7c792c9ffe9dd6695bbc549d2a008005c18e75096c9d455de4d75011dfaa4d18df4ee955de3da692b2a49084285794d9e53df199b0dd5514bee1e387e897d971b6e56f9dcb49bf8a5a4470bf0216816b4ce1ab498957cb5dcc4ef64146a1a424b2d829fe29215e998590213053735618df90485353cee4702194c4de66bd77c3d9cf0fa45ef4b64b5c41186735b46805d2eaf91542507a28805db5838ac3d17ed3227764f5b80d19d8f752f58f01eec5ba12a4c8375a5a47b11f0dc36c2679", 0);
	//mpz_set_str (const_1, "1", 0);
	mpz_set_str (priv, "0x404dcd0061be1e3d4e5dac6322600d442c1f55fd15b5ecc3d6ad52b527cf44b8", 0);
	mpz_set_str (pub, "0x71fd06b1b4c4ea7b392b6f33486063db6fe318559046bf750e4b236d59b883ca9174b3e8c9fc788aa2b926d2eaddd36fa7610e6d91822818a69526057d65c4fe1f7e7620ac54164c21ea2c27783eeb58880a3758b7b8f570383c964f37756f5b331d2afda9bc104e99d1a7fb2d29abf9017fac13cf87b4a6d18838c16aa52e130a3ca1b8b88ce830f982200c5dba7369934af4aee15a83963874b0c04d1fd57cf7525b46e4add4f57c892fefa698be330c22282145ada2589a1a2d2816c470164341a8482de9ad72ed1d636a7836b91218932c565c2b5a5ab03ca5704ca5da13904e0bbd6288d99a9827b751de19bb7c165ce3d910f94f43d6166def03aa895b", 0);

// G^Q=1 (mod P)
// 验证 (G**Q)%P==1

//Function: void mpz_powm (mpz_t rop, const mpz_t base, const mpz_t exp, const mpz_t mod)
//Function: void mpz_powm_ui (mpz_t rop, const mpz_t base, unsigned long int exp, const mpz_t mod)
//Set rop to (base raised to exp) modulo mod.
//
//Negative exp is supported if an inverse base^-1 mod mod exists (see mpz_invert in Number Theoretic Functions). If an inverse doesn’t exist then a divide by zero is raised.
	mpz_powm(tmp, G, Q, P);
    printf("the modulus :");
	mpz_out_str(stdout, 10, tmp);
	printf("\n");

// # 验证公钥私钥
// print square_multi(G,priv)%P

	mpz_powm(tmp, G, priv, P);
    printf("the calculate pub:");
	mpz_out_str(stdout, 10, tmp);
	printf("\n");
// Function: int mpz_cmp (const mpz_t op1, const mpz_t op2)
// 验证和公钥相等
	int result = mpz_cmp(tmp, pub);
    printf("the result:%d\n", result);

// 这个已经用python验证过了
//# 验证第一点 Q能整除P-1  Q|(P-1)
//# 也就是 Q是 P-1的一个素除数
//
//print  ((P-1)/Q)*Q==(P-1)
//
}

//priv = 0x404dcd0061be1e3d4e5dac6322600d442c1f55fd15b5ecc3d6ad52b527cf44b8
//pub = 0x71fd06b1b4c4ea7b392b6f33486063db6fe318559046bf750e4b236d59b883ca9174b3e8c9fc788aa2b926d2eaddd36fa7610e6d91822818a69526057d65c4fe1f7e7620ac54164c21ea2c27783eeb58880a3758b7b8f570383c964f37756f5b331d2afda9bc104e99d1a7fb2d29abf9017fac13cf87b4a6d18838c16aa52e130a3ca1b8b88ce830f982200c5dba7369934af4aee15a83963874b0c04d1fd57cf7525b46e4add4f57c892fefa698be330c22282145ada2589a1a2d2816c470164341a8482de9ad72ed1d636a7836b91218932c565c2b5a5ab03ca5704ca5da13904e0bbd6288d99a9827b751de19bb7c165ce3d910f94f43d6166def03aa895b
//
//P   =0x00e79d25ca547dc8931850eaaa6784e365eecf69374243d902c12df7d4896a9e5b8717c4c7b24e30d1b468061838f5bc76df050ef6b7c58105ee2cf23ecb67e7d89830a0976f606e194d0b85e6566cca6275b7b184416337fc7ac37bebe9c9f76e982b9a82ee0a904900a0a7f76f4760e76120ecd2732a1dfe9a1dfa568757690670460688205a7e0d744feacdc27416a27afe5233dd58945801af83c7fd7199dcbed00819750c81cd3f2b5d68c29cd43e035eed70bfd85f55259df953f4f69d719ebe5c06b3443d249b110e602d81366ea88407ed81d3cf6f6fcea1bb7f9af563d2ca436d5c2d794f06407d1f111cb25a86f7568368e085ebe31f7eb8b9bedb89
//Q  = 0x00c39250922561c4b56a9c1bfb0d523bbfe8395182c5464b38a1d9959aa121871b
//
//G=0x6cde6920c61fa80e51212de15be6b2aca93174e3fd5d479d08affb57222370c9047b099ea9e9d53b694915967709580b77a5cfd70629e1308c9db7a9e8c2f41f3c7c792c9ffe9dd6695bbc549d2a008005c18e75096c9d455de4d75011dfaa4d18df4ee955de3da692b2a49084285794d9e53df199b0dd5514bee1e387e897d971b6e56f9dcb49bf8a5a4470bf0216816b4ce1ab498957cb5dcc4ef64146a1a424b2d829fe29215e998590213053735618df90485353cee4702194c4de66bd77c3d9cf0fa45ef4b64b5c41186735b46805d2eaf91542507a28805db5838ac3d17ed3227764f5b80d19d8f752f58f01eec5ba12a4c8375a5a47b11f0dc36c2679
