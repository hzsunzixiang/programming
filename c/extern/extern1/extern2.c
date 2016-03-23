//Keyword extern is used for declaring extern variables in c. This modifier is used with all data types like int, float, double, array, pointer, structure, function etc. 1. It is default storage class of all global variables as well all functions. For example, Analyze following two c code and its output:




// g++ -Wall -g   extern2.c -o extern2
// /tmp/ccwIsk99.o: In function `main':
// /root/programming/c/extern/extern1/extern2.c:10: undefined reference to `i'
// collect2: error: ld returned 1 exit status
// make: *** [extern2] Error 1

#include <stdio.h>
//extern int i;    //extern variable

//extern2.c:14:12: warning: ‘i’ initialized and declared ‘extern’
//extern int i = 10 ;    //extern variable
//             ^

extern int i = 10 ;    //extern variable
int main(){
	printf("%d\n", i);
	return 0;
}


// Now the question may arise In Both program variable i is extern variable. But why output is different?
// 
// Ans: When we use extern modifier with any variables it is only declaration i.e. memory is not allocated for these variable. Hence in second case compiler is showing error unknown symbol i. To define a variable i.e. allocate the memory for extern variables it is necessary to initialize the variables
