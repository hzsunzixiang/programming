#include<stdio.h>
extern int fee_count,fie_count,foe_count;
extern int yylex(void);
int result[3];
int main()
{
	yylex();
	counter(result);

	printf("%d %d %d \n",result[0],result[1],result[2]);
	return 0;

}
