#include <stdio.h>



// 转换为整形会有警告
// #define offsetof(TYPE, MEMBER) ((int)(&((TYPE *)0)->MEMBER))
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

#define calc2(TYPE, x, y) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x), offsetof(TYPE, y));
#define calc3(TYPE, x, y, z) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld, offsetof("#TYPE", z):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x), offsetof(TYPE, y), offsetof(TYPE, z));
#define calc4(TYPE, w,x, y, z) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld,offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld, offsetof("#TYPE", z):%ld\n", \
			sizeof(TYPE),offsetof(TYPE, w), offsetof(TYPE, x), offsetof(TYPE, y), offsetof(TYPE, z));
// 扩展为 
//  fprintf(stderr, "offsetof(""struct S2"", x):%ld, offsetof(""struct S2"", y):%ld, offsetof(""struct S2"", z):%ld\n", ((size_t) &((struct S2 *)0)->i), ((size_t) &((struct S2 *)0)->j), ((size_t) &((struct S2 *)0)->c));;



struct S1 {
	int i;
	char c;
	int j;
};

struct S2 {
	int i;
	int j;
	char c;
};

// 习题3.41
struct P1 {int i; char c; int j; char d;};
struct P2 {int i; char c; char d; int j;};
struct P3 {short w[3]; char c[3];};
struct P4 {short w[3]; char *c[3];};
struct P5 {struct P1 a[2]; struct P2 *p;};

//  64位机器下
//  sizeof(struct P1):16, offsetof(struct P1, x):0,offsetof(struct P1, x):4, offsetof(struct P1, y):8, offsetof(struct P1, z):12
//  sizeof(struct P2):12, offsetof(struct P2, x):0,offsetof(struct P2, x):4, offsetof(struct P2, y):5, offsetof(struct P2, z):8
//  sizeof(struct P3):10, offsetof(struct P3, x):0, offsetof(struct P3, y):6
//  sizeof(struct P4):32, offsetof(struct P4, x):0, offsetof(struct P4, y):8
//  sizeof(struct P5):40, offsetof(struct P5, x):0, offsetof(struct P5, y):32


int main()
{
	fprintf(stderr, "sizeof(struct S1):%lu, sizeof(struct S2):%lu\n",
			sizeof(struct S1), sizeof(struct S2));
	fprintf(stderr, "&s1.i:%ld, &s1.c:%ld, &s1.j:%ld\n",
			(size_t)&((struct S1*)0)->i, (size_t)&((struct S1*)0)->c, (size_t)&((struct S1*)0)->j);
	fprintf(stderr, "&s1.i:%p, &s1.c:%p, &s1.j:%p\n",
			&((struct S1*)0)->i, &((struct S1*)0)->c, &((struct S1*)0)->j);
	// 64位下强制转换为整形，会有警告
	fprintf(stderr, "offsetof(struct S1, i):%ld, offsetof(structS1, c):%ld, offsetof(struct S1):%ld\n",
			offsetof(struct S1, i), offsetof(struct S1, c), offsetof(struct S1, j));
	calc3(struct S2, i, j, c);
	calc4(struct P1, i, c, j, d);
	calc4(struct P2, i, c, d, j);

	calc2(struct P3, w, c);
	calc2(struct P4, w, c);
	calc2(struct P5, a, p);

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
