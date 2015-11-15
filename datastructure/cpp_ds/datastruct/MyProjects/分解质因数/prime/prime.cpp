//求质数的优化算法!  
 

 
//发表日期：2004年6月13日  出处：cangzhu  作者：cangzhu  已经有2955位读者读过此文 
 


////E-mail:cangzhu@163.com

#include "iostream.h"
#include "stdio.h"

void main()
{
 int count=0;
 for(int i=100;i<1000;i++)
 {
  //偶数，就跳过，它肯定不是质数
  if(i%2==0)
   continue;
  //判断3，5，7，9……i/2是否有i的因子
  int j=3;
  while(j<=i/2&&i%j!=0)
   j+=2;
  //若上述数都不是i的因子，则i是质数
  if(j>i/2)
  {
   //每行输出 8 个数，每8个数输出一回车键
   if(count%8==0)
    cout<<endl;
   //输出质数
   cout<<i<<"  ";
   count++;
  }
 }
 cout<<endl;
}
 
 
