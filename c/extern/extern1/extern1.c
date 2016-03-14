//Keyword extern is used for declaring extern variables in c. This modifier is used with all data types like int, float, double, array, pointer, structure, function etc. 1. It is default storage class of all global variables as well all functions. For example, Analyze following two c code and its output:


#include <stdio.h>
int i;    //By default it is extern variable
int main(){
	printf("%d\n", i);
	return 0;
}



//#include <stdio.h>
//	extern int i;    //extern variable
//	int main(){
//		    printf("%d",i);
//			    return 0;
//	}
