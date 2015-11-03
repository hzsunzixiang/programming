#include <stdio.h>



int main() {


	int x = 100;
	int k = 999;
	typeof (&x) y = &k; // 声明一个 指针


	int x1[10][10];
	typeof (*x1) y1[10];
	typeof (*x1) y2;




//Another way to refer to the type of an expression is with typeof. The syntax of using of this keyword looks like sizeof, but the construct acts semantically like a type name defined with typedef. 

// typedf 

//There are two ways of writing the argument to typeof: with an expression or with a type. Here is an example with an expression:
//
//     typeof (x[0](1))

//Here is an example with a typename as the argument:
//
//     typeof (int *)
	return 0;
}


// https://gcc.gnu.org/onlinedocs/gcc-3.1/gcc/Typeof.html#Typeof
//A typeof-construct can be used anywhere a typedef name could be used. For example, you can use it in a declaration, in a cast, or inside of sizeof or typeof.
//
//    This declares y with the type of what x points to.
//
//              typeof (*x) y;
//              
//
//    This declares y as an array of such values.
//
//              typeof (*x) y[4];
//              
//
//    This declares y as an array of pointers to characters:
//
//              typeof (typeof (char *)[4]) y;
//              
//
//    It is equivalent to the following traditional C declaration:
//
//              char *y[4];
//              
//
//    To see the meaning of the declaration using typeof, and why it might be a useful way to write, let's rewrite it with these macros:
//
//              #define pointer(T)  typeof(T *)
//              #define array(T, N) typeof(T [N])
//              
//
//    Now the declaration can be rewritten this way:
//
//              array (pointer (char), 4) y;
//              
//
//    Thus, array (pointer (char), 4) is the type of arrays of 4 pointers to char. 
