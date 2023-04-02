%{
#include <stdio.h>
%}
%%
x : '\n' ;
%%
yyerror (s)
     char *s;
{
	fprintf (stderr, "%s\n", s);
}
