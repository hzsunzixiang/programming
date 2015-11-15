#include <stdio.h>
#include <stdlib.h>
#include "stack.h"


void initLinkStack( LinkStack **s )
{
    (*s) = (LinkStack *)malloc(sizeof(LinkStack));

    (*s)->counter = 0;
    (*s)->top = NULL;

    return;
}

status push( LinkStack *s, ElemType e )
{
    LinkStackPtr p = (LinkStackPtr)malloc(sizeof(StackNode));

    p->data = e;
    p->next = s->top;
    s->top = p;
    s->counter++;

    return OK;
}

status pop( LinkStack *s, ElemType *e )
{
    if( s->top == NULL )
    {
        return ERROR;
    }

    LinkStackPtr p = s->top;

    *e = p->data;

    s->top = p->next;
    s->counter--;

    free(p);

    return OK;
}

