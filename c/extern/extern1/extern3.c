// If you will not use extern keyword with global variables then compiler will automatically initialize with default value to extern variable.
// 
// Default initial value of extern integral type variable is zero otherwise null. For example:

#include <stdio.h>
char c;
int i;
float f;
char *str;  
int main(){
	printf("%d %d %f %s\n", c, i, f, str);
	return 0;
}

// 0 0 0.000000 (null)

