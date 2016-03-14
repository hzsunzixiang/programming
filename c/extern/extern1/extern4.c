//We cannot initialize extern variable locally i.e. within any block either at the time of declaration or separately. We can only initialize extern variable globally. For example:

// (a)



// extern4.c: In function ‘int main()’:
// extern4.c:7:14: error: ‘i’ has both ‘extern’ and initializer
//    extern int i = 10; //Try to initialize extern variable
//               ^
// extern4.c:9:18: error: ‘i’ was not declared in this scope
//    printf("%d\n", i);
//                   ^
// make: *** [extern4] Error 1

#include <stdio.h>
	int main(){
		extern int i = 10; //Try to initialize extern variable
		//locally.
		printf("%d\n", i);
		return 0;
	}

// Output: Compilation error: Cannot initialize extern variable.
// 
// (b)
// 
// #include <stdio.h>
// 	int main(){
// 		extern int i; //Declaration of extern variable i.
// 		int i=10;     //Try to locally initialization of
// 		//extern variable i.
// 		printf("%d",i);
// 		return 0;
// 	}
// 
// Output: Compilation error: Multiple declaration of variable i.
