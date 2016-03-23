// A particular extern variable can be declared many times but we can initialize at only one time. For example:
// 
// (a)
// 
// extern int i; //Declaring the variable i.
// int i=25;     //Initializing the variable.
// extern int i; //Again declaring the variable i.
// #include <stdio.h>
// int main(){
//     extern int i; //Again declaring the variable i.
//     printf("%d",i);
//     return 0;
// }
// 
// Output: 25
// 
// (b)
// 
extern int i; //Declaring the variable
int i=25;     //Initializing the variable
#include <stdio.h>
int main(){
    printf("%d",i);
    return 0;
}

// int i=20; //Initializing the variable

//Output: Compilation error: Multiple initialization variable i


// root@iZ25ox3a5vlZ:~/programming/c/extern/extern1# make
// g++ -Wall -g   extern7.1.c -o extern7.1
// extern7.1.c:27:5: error: redefinition of ‘int i’
//  int i=20; //Initializing the variable
//      ^
// extern7.1.c:20:5: note: ‘int i’ previously defined here
//  int i=25;     //Initializing the variable
//      ^
// make: *** [extern7.1] Error 1

