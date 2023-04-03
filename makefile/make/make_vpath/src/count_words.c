#include<stdio.h>

extern int fee_count, fie_count, foe_count, fum_count;
extern int yylex(void);
int result[4];

int main()
{	
	yylex();
	counter(result);

	printf("%d %d %d %d \n", result[0], result[1], result[2], result[3]);
	/*printf("%d %d %d %d \n",fee_count,fie_count,foe_count,fum_count);*/
	return 0;
}
