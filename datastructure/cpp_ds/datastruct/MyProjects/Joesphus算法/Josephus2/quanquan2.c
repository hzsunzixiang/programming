/*求围圈问题的详细算法和程序*/
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int* arr;    /* 用于存储“那些人” */
    int n;        /* “那些人”的总数 */
    int s;        /* 开始的编号 */
    int m;        /* 间隔多少个人出列一个 */
    int i,j;
    
    printf("请输入多少个人：\n");
    scanf("%d",&n);
    
    printf("请输入开始的序号：\n");
    scanf("%d",&s);
    
    printf("请输入间隔的人数：\n");
    scanf("%d",&m);
    
    arr = (int*)(malloc(sizeof(int) * n));    /* 申请一个数组，以存储“那些人” */
    
    if (arr == NULL)    /* 并非一定分配成功的 */
    {
        printf("空间不足，程序退出。\n");
        return 1;
    }
    
    for (i = 0;i < n;i++)
    {
        arr[i] = i + 1;    /* 填空数组，编号是下标加一，注意C语言中的数组下标从0开始 */
    }
    
    printf("出列顺序：\n");
    
    j = s + m - 2;    /* 这是第一个要出列的人的下标 */
    
    while (n > 1)    /* 当队列中还有不止一个人的时候，要就进行出列的动作 */
    {
        printf("%d\n",arr[j]);    /* 把这个家伙打印出来 */
        
        /* 这个家伙走了以后，后面的人应该依次顶上来 */
        for (i = j;i < n - 1;i++)
        {
            arr[i] = arr[i + 1];
        }
        n--;    /* 并且整个队列的人少了一个，也就是长度要减掉一 */
        /* 这是下一个要出列的人 */
        j = (j + m - 1) % n;
    }
    
    /* 现在只有一个人了，就是arr[0] */
    printf("最后一个是：%d\n",arr[0]);
    
    free(arr);    /* 记得要释放申请的空间 */    
  system("pause"); 
    return 0;
}


