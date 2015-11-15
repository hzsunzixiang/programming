#ifndef STACK_C_HERDER
#define STACK_C_HERDER

#include <stdio.h>
#include <stdlib.h>


#define OK      1
#define FALSE   0
#define TRUE    1
#define ERROR   0

typedef int ElemType;
typedef int status;

typedef struct StackNode
{
    ElemType data;
    struct StackNode *next;
}StackNode, *LinkStackPtr;

typedef struct
{
    LinkStackPtr top;
    int counter;
}LinkStack;

void initLinkStack( LinkStack **s );
status push( LinkStack *s, ElemType e );
status pop( LinkStack *s, ElemType *e );

#endif 
