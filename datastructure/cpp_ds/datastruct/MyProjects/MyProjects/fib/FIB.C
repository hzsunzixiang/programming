/*计算Fibonacci数列第n项值的递归函数*/
#include<stdio.h>
long fib(int n)
{
if ( n==0 || n==1 )
	return n;
else
	return (fib(n-1)+fib(n-2));
}
main()
{
	int i,n;
	printf("\nPlease number N: \n");
	scanf("%d",&n);
	for (i=0;i<=n;i++)
		printf("Fib(%d)=%ld\n",i,fib(i));
}