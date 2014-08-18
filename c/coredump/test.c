#include <stdio.h>
#include <stdlib.h>

int main(void)

{

    printf("hello world! dump core for set value to NULL pointer\n\n\n");
    fflush(stdout);

    *(char *)0 = 0;

    return 0;

}
