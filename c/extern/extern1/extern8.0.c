//We cannot write any assignment statement globally. For example:

#include <stdio.h>
extern int i;
int i = 10;   //Initialization statement
i = 25;       //Assignment statement
int main(){

    printf("%d\n", i);
    return 0;
}

// Output: Compilation error Note: Assigning any value to the variable at the time of declaration is known as initialization while assigning any value to variable not at the time of declaration is known assignment. (b)
// 
// #include <stdio.h>
// extern int i;
// int main(){
//     i=25;       //Assignment statement
//     printf("%d",i);
//     return 0;
// }
// int i=10;   //Initialization statement
