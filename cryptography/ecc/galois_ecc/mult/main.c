
#include <stdio.h>
#include <stdint.h>

// 定义在GF(2^8)上
// 意思是说 x>>7 最高位是否是1 
// 如果是1 则 异或 0x1b
// 如果是0 则异或 0  , 也就是它本身
static uint8_t xtime(uint8_t x)
{
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
}


// Multiply is used to multiply numbers in the field GF(2^8)
// Note: The last call to xtime() is unneeded, but often ends up generating a smaller binary
//       The compiler seems to be able to vectorize the operation better this way.
//       See https://github.com/kokke/tiny-AES-c/pull/34
static uint8_t Multiply(uint8_t x, uint8_t y)
{
	return (((y & 1) * x) ^
			((y>>1 & 1) * xtime(x)) ^
			((y>>2 & 1) * xtime(xtime(x))) ^
			((y>>3 & 1) * xtime(xtime(xtime(x)))) ^
			((y>>4 & 1) * xtime(xtime(xtime(xtime(x)))))); /* this last call to xtime() can be omitted */
}
void test_forward()
{
	int res;
	int x1 = 0x87;
	int x2 = 0x6e;
	int x3 = 0x46;
	int x4 = 0xA6;

	res = Multiply(x1, 2) ^  Multiply(x2, 3) ^ x3 ^ x4;
	printf("the result :0x%x\n", res);
}
void test_inv()
{
	int res;
	int x1 = 0x47;
	int x2 = 0x37;
	int x3 = 0x94;
	int x4 = 0xED;

	res = Multiply(x1, 0xE) ^  Multiply(x2, 0xB) ^ Multiply(x3, 0xD) ^ Multiply(x4, 0x9);
	printf("the result :0x%x\n", res);
}
int main()
{
	int x = 0x6E;
	int y = 3;
	int res = Multiply(x, y);
	printf("the result :0x%x\n", res);
	// 验证书上的AES算法列混淆变换 P119
	test_forward();
	test_inv();




	return 0;
}
