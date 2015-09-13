// test 2D array creation with exception throwing

#include <iostream.h>
#include "make2db.h"
#include <except.h>
#include <stdlib.h> // has exit()

void main(void)
{
   int **a;
   try {Make2DArray(a,2,2);}
   catch (xalloc) {
       cerr << "Could not create the array" << endl;
       exit(1);}
   a[0][0] = 1; a[0][1] = 2; a[1][0] = 3; a[1][1] = 4;
   cout << a[0][0] << ' ' << a[0][1] << endl;
   cout << a[0][0] << ' ' << a[1][1] << endl;
}
