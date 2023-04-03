#include<stdio.h>
#include"lexer.h"
#include"counter.h"
void counter(int counts[3])
{
	while( yylex() )
		;
	printf("counter over\n");
	counts[0]=fee_count;
	counts[1]=fie_count;
	counts[2]=foe_count;

}
