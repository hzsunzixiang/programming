// A particular extern variable can be declared many times but we can initialize at only one time. For example:
// 
// (a)
// 
extern int i; //Declaring the variable i.
int i=25;     //Initializing the variable.
extern int i; //Again declaring the variable i.
#include <stdio.h>
int main(){
    extern int i; //Again declaring the variable i.
    printf("%d",i);
    return 0;
}

// Output: 25
// 
// (b)
// 
// extern int i; //Declaring the variable
// int i=25;     //Initializing the variable
// #include <stdio.h>
// int main(){
//     printf("%d",i);
//     return 0;
// }
// 
// int i=20; //Initializing the variable
// 
// Output: Compilation error: Multiple initialization variable i
