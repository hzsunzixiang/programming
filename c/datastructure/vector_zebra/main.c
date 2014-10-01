
#include "zebra.h"

#include "vector.h"
#include "memory.h"
int main ()
{
		int *x1=(int*)malloc(sizeof(int));
		int *x2=(int*)malloc(sizeof(int));
		*x1=8;
		*x2=9;
		vector vec=vector_init(3);
		vector_set(vec,x1);
		vector_set(vec,x2);
		printf("size:%d\n",vector_count(vec));
		int * find=vector_lookup(vec,1);
		printf("value:%d\n",*find);
		return 0;
}
