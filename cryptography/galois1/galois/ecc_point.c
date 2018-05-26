

#include <stdio.h>
#include <math.h>
#include "galois.h"

int gArray[16]={1, 2, 4, 8, 3};
unsigned int w = 4;

// 这里用gcc 不支持引用， 所以暂时用全局变量记录xr, yr
int xr;
int yr;

void Generator();
void Output();
int Verify(int x, int y, int a, int b);
int Calc_2p(int x, int y, int a, int b);
int Calc_point(int xp, int yp, int xq, int yq, int a, int b);
int Calc_all(int xp, int yp, int xq, int yq, int a, int b);

int main(int argc, char **argv)
{

	// 生成所有元素
	Generator();
	// 输出
	Output();
	// 生成元计算完毕

	// 开始定义椭圆曲线   y^2 + xy = x^3 + ax^2 + b
	// 考虑椭圆曲线   y^2 + xy = x^3 + g^4*x^2 + b 此时a=g^4=3 b =g^0=1; (a, b)=(g^4, 1)
	int a = gArray[4];
	int b = 1;
	// 也就是 y^2 + xy = x^3 + 3*x^2 + 1 
	// 满足 该方程的一个点为(x, y)= (g^5, g^3) = (6, 8)
	// ------开始验证
	int x = gArray[5];
	int y = gArray[3];
	Verify(x, y, a, b);

	// ------验证完毕

	// 开始计算

	Calc_2p(x, y, a, b);
	// 结果为(1, 14) = (g^0, g^6) = (1, g^6)  是上面的点

    //Calc_point(x, y, xr, yr, a, b);
    Calc_point(x, y, xr, yr, a, b);
	//Verify(6, 8, a, b);
	//Verify(1, 13, a, b);
	//Verify(7, 2, a, b);
	
	// 开始计算这条曲线上所有的点 初始值一样
	// 可见 (8,5)是生成元， 而上面 (6,8)则不是
	x = 8; 
	y = 5;
	Calc_all(x, y, x, y, a, b);


	return 0;
}
void Generator()
{
  // 以GF(2^4) 为例来研究椭圆曲线加密算法

  // 首先多项式为 f(x) = x^4 + x + 1
  //  生成元满足 f(g) = 0  即 g^4=g+1
  // 现在开始定义生成元的各幂次
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

}
void Output()
{
	for(int i = 0; i < pow(2, 4); i++)
	{
		printf("gArray[%d]=%d\n", i, gArray[i]);
	}
}
int Verify(int x, int y, int a, int b)
{
	// 分步计算
	// 计算y^2
	int y_2 = galois_single_multiply(y, y, w);
	int x_y = galois_single_multiply(x, y, w);
	int left = y_2 ^ x_y;

	int x_2 = galois_single_multiply(x, x, w);
	int x_3 = galois_single_multiply(x_2, x, w);
	int a_x_2 = galois_single_multiply(a, x_2, w);

	int right = x_3 ^ a_x_2 ^ b;
	//printf("left:%d, right:%d\n", left, right);
	if (left != right)
	{
		printf("error ...........\n");
	}
	return 0;

}
int Calc_2p(int x, int y, int a, int b)
{
	// ----计算2P
	// 若P=(xp, yp), 则 R=2P=(xr, yr) 由下列规则确定:

	// lamda = xp + yp/xp
	// (xr, yr) = (lamda^2 + lamda + a, xp^2 + (lamda+1)*xr)

	// 不需要求xp的逆 可以一步到位求除法
	// 计算yp/xp
	int yp_xp = galois_single_divide(y, x, w);
	int lamda = x ^ yp_xp;
	xr = galois_single_multiply(lamda, lamda, w) ^ lamda ^ a;
	yr = galois_single_multiply(x, x, w) ^ galois_single_multiply((lamda^1), xr, w);
	printf("(xr,yr)=(%d,%d)\n", xr, yr);
}

int Calc_point(int xp, int yp, int xq, int yq, int a, int b)
{
	// ----计算P + Q
	// 若P=(xp, yp), Q=(xq, yq) 且 P != -Q, P != Q
	// 则 R = P + Q = (xr, yr) 由下列规则确定:

	// lamda = (yp + yq)/(xp + xq) 
	// (xr, yr) = (lamda^2 + lamda + xp + xq + a, lamda(xp+xr)+xr+yp)

	//printf("xp:%d, yp:%d, xq:%d, yq:%d, a:%d, b:%d\n", xp, yp, xq, yq, a, b);
	int lamda = galois_single_divide((yp^yq), (xp^xq), w);
	xr = galois_single_multiply(lamda, lamda, w) ^ lamda ^ xp ^ xq ^ a;
	yr = galois_single_multiply(lamda, (xp^xr), w) ^ xr ^ yp;
	//printf("yr:%d\n", yr);
	//printf("(xr,yr)=(%d,%d)\n", xr, yr);
}
int Calc_all(int xp, int yp, int xq, int yq, int a, int b)
{
	int k = 0;
	for(int i=0; i<150; i++)
	{
		if((xp==xq) && (yp==yq))
		{
			printf("kp:%d (xp, yp):(%d, %d), (xq, yq)(%d, %d)\n", ++k, xp, yp, xq, yq);
	        Calc_2p(xp, yp, a, b);
			xq = xr;
			yq = yr;
		}
		else if(xp==xq)
		{
			printf("kp:%d (xp, yp):(%d, %d), (xq, yq)(%d, %d)\n", ++k, xp, yp, xq, yq);
			break;
		}
		else
		{
			Calc_point(xp, yp, xq, yq, a, b);
			printf("kp:%d (xp, yp):(%d, %d), (xq, yq)(%d, %d)\n", ++k, xp, yp, xq, yq);
			xq = xr;
			yq = yr;
		}
		Verify(xr, yr, a, b);
	}

}

