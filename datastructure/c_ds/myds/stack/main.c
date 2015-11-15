#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

int main()
{
    LinkStack *s = NULL;

    ElemType e;

    initLinkStack( &s );

    push( s, 23 );

    pop( s, &e );

    printf("%d\n", e);

    return 0;
}
