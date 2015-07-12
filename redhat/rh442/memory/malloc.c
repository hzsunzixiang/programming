/* malloc example: random string generator*/
#include <stdio.h>      /* printf, scanf, NULL */
#include <stdlib.h>     /* malloc, free, rand */
#include <string.h>     

int main ()
{
    int i,n;
    char * buffer;

    i = 1024*1024;
    for(;;)
    {
        buffer = (char*) malloc (i+1);
        if (buffer==NULL) exit (1);
        memset (buffer, '-', i);
    }

    //free (buffer);

    return 0;
}
