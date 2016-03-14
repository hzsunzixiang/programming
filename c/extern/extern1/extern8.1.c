// We cannot write any assignment statement globally. For example:
// 
// #include <stdio.h>
// extern int i;
// int i=10;   //Initialization statement
// i=25;       //Assignment statement
// int main(){
//     printf("%d",i);
//     return 0;
// }
// 
// Output: Compilation error Note: Assigning any value to the variable at the time of declaration is known as initialization while assigning any value to variable not at the time of declaration is known assignment. (b)
// 


// root@iZ25ox3a5vlZ:~/programming/c/extern/extern1# gcc extern9.0.c  extern9.1.c  -o extern9.0 

#include <stdio.h>
extern int i;
int main(){
    i = 25;       //Assignment statement
    printf("%d\n", i);
    return 0;
}
int i = 10;   //Initialization statement
