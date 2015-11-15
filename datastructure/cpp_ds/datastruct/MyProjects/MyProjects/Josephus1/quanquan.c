/*the algorithm and programme of the problem of Josephus*/
/*n人围成一圈，编号为1，2，3，……，17，从1开始报数，报到m的倍数的人离开，
一直下去，直到最后剩下1人，求此人的编号  */
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
 int n, m;   
 int* a;    /* 用于存储“那些人” */
 int i, j, s;  
 
 printf("please input the number of the poeple：\n");
   scanf("%d",&n);
   printf("请输入是哪个数字的倍数：\n");
   scanf("%d",&m);

   a = (int*)(malloc(sizeof(int) * n));    /* 申请一个数组，以存储“那些人” */
    
   if (a == NULL)    /* 并非一定分配成功的 */
   {
      printf("空间不足，程序退出。\n");
      return 1;
   }
    
   for (i = 0; i < n; i++)
   {
      a[i] = i + 1;    /* 填空数组，编号是下标加一，注意C语言中的数组下标从0开始 */
   } 
 i = 0;   //从下标为 i%n 的元素开始数数 
 j = 0;   //记录已经退出的元素的个数 
 s = n;   //记录尚未退出的元素的个数 
 while(s > 1)
   {
  if(a[i%n] != 0) //如果元素值不为0，则表示其尚未退出 
  {
   if((i+1-j)%m == 0) //判断当前报数(i+1-j)是否为m的倍数，（-j）表示跳过j个元素 
   {  
    printf("第%d号出列\n",a[i%n]);    /* 把这个家伙打印出来 */
    a[i%n] = 0;   //已经退出的元素赋值为0 
    s--;    //退出一个元素 
   }
  }
  else   //如果元素值为0，则表示其已经退出
   j++; //此时i值仍然会累加，但我们记下这个已经退出的元素 ，以便报数时跳过它  
  i++;
 }
  
 for(i=0; i<n; i++)
  if(a[i] != 0)
    printf("最后一个是：%d\n",a[i]); 
    
 free(a);    /* 记得要释放申请的空间 */ 
 system("pause"); 
   return 0;                 
}


