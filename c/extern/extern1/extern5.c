
// We cannot initialize extern variable locally i.e. within any block either at the time of declaration or separately. We can only initialize extern variable globally. For example:
// 
// (a)
// 
// #include <stdio.h>
// 	int main(){
// 		extern int i=10; //Try to initialize extern variable
// 		//locally.
// 		printf("%d",i);
// 		return 0;
// 	}
// 
// Output: Compilation error: Cannot initialize extern variable.
// 
// (b)


// g++ -Wall -g   extern5.c -o extern5
// extern5.c: In function ‘int main()’:
// extern5.c:21:7: error: redeclaration of ‘int i’
//    int i = 10;     //Try to locally initialization of
//        ^
// extern5.c:20:14: note: previous declaration ‘int i’
//    extern int i; //Declaration of extern variable i.
//               ^
// make: *** [extern5] Error 1

#include <stdio.h>
	int main(){
		extern int i; //Declaration of extern variable i.
		int i = 10;     //Try to locally initialization of
		//extern variable i.
		printf("%d\n", i);
		return 0;
	}

// Output: Compilation error: Multiple declaration of variable i.
