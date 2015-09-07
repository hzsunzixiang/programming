

// 这是执行 gcc -E main.c 之后的裁剪的结果

struct _test_
{
	int x;
	int y;
	int z;
};

void Assignment(struct _test_ *t)
{
	t->x = 1;
	t->y = 2;
	t->z = 3;
}

//  #define container_of(ptr, type, member) ({   \
//  		const typeof( ((type *)0)->member ) *__mptr = (ptr); \
//  		(type *)( (char *)__mptr - offsetof(type,member) );})
//  #define offsetof(TYPE, MEMBER) ((int)(&((TYPE *)0)->MEMBER))

void GetheadPoint(int *tz)
{
	struct _test_ *p;
	int temp = -1;

	// 必须 是 ({ })  这种形式
	p = ({ 
			const typeof( ((struct _test_ *)0)->z ) *__mptr = (tz);    // 声明一个指针 *__mptr 类型为typeof计算出来的结果 ， 其值为传过来的指针
			(struct _test_ *)( (char *)__mptr - ((int)(&((struct _test_ *)0)->z)) );  //  __mptr 减去偏移量即为 结构体首地址
		});
	temp = p->y;

	printf("line31 = %d\n", temp);
}

int main(void)
{
	int temp = -1;

	struct _test_ tmp;

	Assignment(&tmp);
	GetheadPoint(&tmp.z);

	printf("line43 tmp - >x = %d\n", tmp.x);

	return 0;
}
