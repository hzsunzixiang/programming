#include<stdio.h>

/*extern int fee_count,fie_count,foe_count;*/
extern int fee_count,fie_count,foe_count; /*depend on counter.h*/


void counter(int counts[3])
{
	while( yylex() ) /* depend on lexer.h*/
		;
	printf("counter over\n");
	counts[0]=fee_count;
	counts[1]=fie_count;
	counts[2]=foe_count;

}
