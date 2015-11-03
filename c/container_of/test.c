#include <stdio.h>



int foo()
{
	return -19;
}
int main() {
	int i = 0;
	printf("i = %d\n", ({++i; ++i;}));



	// 求一个变量的绝对值
	// is a valid (though slightly more complex than necessary) expression for the absolute value of foo (). 
	int k = ({ int y = foo (); int z;
			if (y > 0) z = y;
			else z = - y;
			z; });

	printf("k = %d\n", k);


#define max(a,b) ((a) > (b) ? (a) : (b))

#define maxint(a,b) \
	({int _a = (a), _b = (b); _a > _b ? _a : _b; })






	//The last thing in the compound statement should be an expression followed by a semicolon; the value of this subexpression serves as the value of the entire construct. (If you use some other kind of statement last within the braces, the construct has type void, and thus effectively no value.)
	//
	//This feature is especially useful in making macro definitions "safe" (so that they evaluate each operand exactly once). For example, the "maximum" function is commonly defined as a macro in standard C as follows:
	//
	//     #define max(a,b) ((a) > (b) ? (a) : (b))
	//     
	//
	//But this definition computes either a or b twice, with bad results if the operand has side effects. In GNU C, if you know the type of the operands (here let's assume int), you can define the macro safely as follows:
	//
	//     #define maxint(a,b) \
	//       ({int _a = (a), _b = (b); _a > _b ? _a : _b; })
	//     
	//
	//Embedded statements are not allowed in constant expressions, such as the value of an enumeration constant, the width of a bit-field, or the initial value of a static variable.
	//
	//If you don't know the type of the operand, you can still do this, but you must use typeof (see Typeof) or type naming (see Naming Types). 


	return 0;
}
