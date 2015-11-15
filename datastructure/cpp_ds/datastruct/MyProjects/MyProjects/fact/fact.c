#include<stdio.h>
long factorial(int n)
{
   if (n==0)
       return (1);
   else
       return (n*factorial(n-1));
}
/*œ‘ æ1!-10!*/
main()
{
   int i;
   for (i=1;i<=10;i++)
      printf("%d!=%ld\n",i,factorial(i));
} 
