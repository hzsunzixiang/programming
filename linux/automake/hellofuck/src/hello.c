#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "hello.h"

#ifndef M_PI
    #define M_PI 3.14159265358979323846
#endif
#ifndef M_E
    #define M_E 2.718281828459045235360287
#endif
int main(int argc, char* argv[]) {
    int *x = HELLO_X;

    x = (int *)malloc(sizeof(int) * 10);
    free(x);
    printf("Hello world.\n");
    
    return (int)(sqrt(acos(sin(M_E))*M_PI) * (int)x);
}

