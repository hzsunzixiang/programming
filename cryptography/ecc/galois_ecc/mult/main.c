
#include <stdio.h>
int gf_mult(
		int m, // GF(2 ^ M)
		int poly, // low order terms of g(x)
		int v1,
		int v2)
{
	int prod = 0;
	int k;
	int mask;
	/* Multiply phase */
	for (k = 0; k < m; k++)
	{
		if (v1 & 1)
		{
			prod ^= (v2 << k);
		}
		v1 >>= 1;
		if (v1 == 0)
			break;
	}
	/* Reduce phase */
	mask = 1 << m;
	mask <<= m - 2;
	for (k = m - 2; k >= 0; k--)
	{
		if (prod & mask)
		{
			prod &= ~mask;
			prod ^= (poly << k);
		}
		mask >>= 1;
	}
		return(prod);
}


// 这个是错误的
int main()
{
	int poly =  11; // x^3+x+1 = (1011) =11
	int m = 3;
	int v1 = 7;
	int v2 = 7;
	int res = gf_mult(m, poly, v1, v2);
	printf("the result :%d\n", res);
	return 0;
}
