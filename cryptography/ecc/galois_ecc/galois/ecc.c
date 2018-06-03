



#include <stdio.h>
#include "galois.h"

int main(int argc, char **argv)
{
  unsigned int w = 4;
  // 以GF(2^4) 为例来研究椭圆曲线加密算法

  // 首先多项式为 f(x) = x^4 + x + 1
  //  生成元满足 f(g) = 0  即 g^4=g+1
  // 现在开始定义生成元的各幂次
  int gArray[16]={1, 2, 4, 8, 3};
  //for(int i = 0; i < 16; i++)
  //{
  //    printf("gArray[%d]=%d\n", i, gArray[i]);
  //}
  
  // 根据生成元 计算其他幂次
  gArray[5] = galois_single_multiply(gArray[1], gArray[4], w);
  gArray[6] = galois_single_multiply(gArray[1], gArray[5], w);
  gArray[7] = galois_single_multiply(gArray[1], gArray[6], w);
  gArray[8] = galois_single_multiply(gArray[1], gArray[7], w);
  gArray[9] = galois_single_multiply(gArray[1], gArray[8], w);
  gArray[10] = galois_single_multiply(gArray[1], gArray[9], w);
  gArray[11] = galois_single_multiply(gArray[1], gArray[10], w);
  gArray[12] = galois_single_multiply(gArray[1], gArray[11], w);
  gArray[13] = galois_single_multiply(gArray[1], gArray[12], w);
  gArray[14] = galois_single_multiply(gArray[1], gArray[13], w);
  gArray[15] = galois_single_multiply(gArray[1], gArray[14], w);

  for(int i = 0; i < 16; i++)
  {
	  printf("gArray[%d]=%d\n", i, gArray[i]);
  }
  // 生成元计算完毕
  
  // 开始定义椭圆曲线   y^2 + xy = x^3 + ax^2 + b
  // 考虑椭圆曲线   y^2 + xy = x^3 + g^4*x^2 + b 此时a=g^4=3 b =g^0=1; (a, b)=(g^4, 1)
  int a = gArray[4];
  int b = 1;
  // 也就是 y^2 + xy = x^3 + 3*x^2 + 1 
  // 满足 该方程的一个点为(x, y)= (g^5, g^3)
  // ------开始验证
  int x = gArray[5];
  int y = gArray[3];
  // 分步计算
  // 计算y^2
  int y_2 = galois_single_multiply(y, y, w);
  int x_y = galois_single_multiply(x, y, w);
  int left = y_2 ^ x_y;

  int x_2 = galois_single_multiply(x, x, w);
  int x_3 = galois_single_multiply(x_2, x, w);
  int a_x_2 = galois_single_multiply(a, x_2, w);

  int right = x_3 ^ a_x_2 ^ b;
  printf("left:%d, right:%d\n", left, right);
  // ------验证完毕

  // 开始计算这条曲线上所有的点
  // 若P=(xp, yp), 则 R=2P=(xr, yr) 由下列规则确定:

  // lamda = xp + yp/xp
  // (xr, yr) = (lamda^2 + lamda + a, xp^2 + (lamda+1)*xr)

  // 开始计算

  // x, y, a, b 在上面定义
  // 不需要求xp的逆 可以一步到位求除法
  // 计算yp/xp
  int yp_xp = galois_single_divide(y, x, w);
  int lamda = x ^ yp_xp;
  int xr = galois_single_multiply(lamda, lamda, w) ^ lamda ^ a;
  int yr = galois_single_multiply(x, x, w) ^ galois_single_multiply((lamda^1), x, w);
  printf("(xr,yr)=(%d,%d)\n", xr, yr);
  // 结果为(1, 14) = (g^0, g^6) = (1, g^6)  是上面的点

  return 0;
}
