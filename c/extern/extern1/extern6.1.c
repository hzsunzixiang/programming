
// If we declare any variable as extern variable then it searches that variable either it has been initialized or not. If it has been initialized which may be either extern or static* then it is ok otherwise compiler will show an error. For example:
// 
// (a)
// 
// #include <stdio.h>
// int main(){
//     extern int i; //It will search the initialization of
//                   //variable i.
//     printf("%d",i);
//     return 0;
// }
// int i=20;    //Initialization of variable i.

// Output: 20
// 
// (b)
// 
 #include <stdio.h>
 int main(){
     extern int i; //It will search the any initialized
                   //variable i which may be static or 
                   //extern.
     printf("%d\n", i);
     return 0;
 }
 extern int i = 20; //Initialization of extern variable i.
// 
// Output: 20 (c)
// 
// #include <stdio.h>
// int main(){
//     extern int i; //It will search the any initialized
//                   //variable i which may be static or 
//                   //extern.
//     printf("%d",i);
//     return 0;
// }
// static int i=20; //Initialization of static variable i.
// 
// Output: 20
