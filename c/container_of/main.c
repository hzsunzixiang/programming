#include <stdio.h>

#define offsetof(TYPE, MEMBER) ((int)(&((TYPE *)0)->MEMBER))

#define container_of(ptr, type, member) ({   \
		const typeof( ((type *)0)->member ) *__mptr = (ptr); \
		(type *)( (char *)__mptr - offsetof(type,member) );})

struct _test_
{
	int  x;
	int  y;
	int  z;
};

void Assignment(struct _test_ *t)
{
	t->x = 1;
	t->y = 2;
	t->z = 3;
}

void GetheadPoint(int *tz)
{
	struct _test_ *p;
	int temp = -1;

	p = container_of(tz,struct _test_, z);   //根据成员变量的地址获得该结构体的首地址
	temp = p->y;                                       //根据首地址获得其中另外一个成员变量的值

	printf("line31 = %d\n", temp);
}

int main(void)
{
	int temp = -1;

	struct _test_ tmp;                            //定义一个结构体变量

	Assignment(&tmp);                         //给这个变量赋值
	GetheadPoint(&tmp.z);                   //只传给这个函数一个结构体成员变量的地址

	printf("line43 tmp - >x = %d\n", tmp.x);

	return 0;
}

