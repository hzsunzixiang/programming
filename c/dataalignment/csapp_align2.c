#include <stdio.h>



// 转换为整形会有警告
// #define offsetof(TYPE, MEMBER) ((int)(&((TYPE *)0)->MEMBER))
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

#define calc2(TYPE, x, y) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x), offsetof(TYPE, y));
#define calc3(TYPE, x, y, z) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld, offsetof("#TYPE", z):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x), offsetof(TYPE, y), offsetof(TYPE, z));
#define calc4(TYPE, w, x, y, z) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", w):%ld,offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld, offsetof("#TYPE", z):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, w), offsetof(TYPE, x), offsetof(TYPE, y), offsetof(TYPE, z));
#define calc8(TYPE, x1, x2, x3, x4, x5, x6,x7,x8) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", "#x1"):%ld,offsetof("#TYPE", "#x2"):%ld, offsetof("#TYPE", "#x3"):%ld, offsetof("#TYPE", "#x4"):%ld, offsetof("#TYPE", "#x5"):%ld, offsetof("#TYPE", "#x6"):%ld, offsetof("#TYPE", "#x7"):%ld, offsetof("#TYPE", "#x8"):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x1), offsetof(TYPE, x2), offsetof(TYPE, x3), offsetof(TYPE, x4), offsetof(TYPE, x5), offsetof(TYPE, x6), offsetof(TYPE, x7), offsetof(TYPE, x8));
// 扩展为 
//  fprintf(stderr, "offsetof(""struct S2"", x):%ld, offsetof(""struct S2"", y):%ld, offsetof(""struct S2"", z):%ld\n", ((size_t) &((struct S2 *)0)->i), ((size_t) &((struct S2 *)0)->j), ((size_t) &((struct S2 *)0)->c));;

// sizeof(struct Foo):56,
// offsetof(struct Foo, a):0,offsetof(struct Foo, b):8, offsetof(struct Foo, c):16, offsetof(struct Foo, d):24, 
// offsetof(struct Foo, e):28, offsetof(struct Foo, f):32, offsetof(struct Foo, g):40, offsetof(struct Foo, h):48
//
struct Foo{
	char *a;
	short b;
	double c;
	char d;
	float e;
	char f;
	long long g;
	void *h;
} ;

// 习题3.42

// sizeof(struct Foo1):40,
// offsetof(struct Foo1, c):0,offsetof(struct Foo1, g):8, offsetof(struct Foo1, a):16, offsetof(struct Foo1, h):24, 
// offsetof(struct Foo1, e):32, offsetof(struct Foo1, b):36, offsetof(struct Foo1, d):38, offsetof(struct Foo1, f):39

struct Foo1{
	double c;
	long long g;
	char *a;
	void *h;
	float e;
	short b;
	char d;
	char f;
} ;

int main()
{
	calc8(struct Foo, a, b, c, d, e, f, g, h);
	calc8(struct Foo1, c, g, a, h, e, b, d, f);

	return 0;

}

/*
//  在宏体中，如果宏参数前加个#，那么在宏体扩展的时候，宏参数会被扩展成字符串的形式。如：
//  
//  #define WARN_IF(EXP) \
//       do { if (EXP) \
//               fprintf (stderr, "Warning: " #EXP "\n"); } \
//       while (0)
//  
//  WARN_IF (x == 0);会被扩展成：
//  
//  do { if (x == 0)
//      fprintf (stderr, "Warning: " "x == 0" "\n"); }
//  while (0);
//  
//  这种用法可以用在assert中，如果断言失败，可以将失败的语句输出到反馈信息中
*/
