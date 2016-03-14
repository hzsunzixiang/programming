// If declared an extern variables or function globally then its visibility will whole the program which may contain one file or many files. For example consider a c program which has written in two files named as one.c and two.c: (a)

#include <stdio.h>
//one.c

int i = 25; //By default extern variable
int j = 5;  //By default extern variable
/**
Above two line is initialization of variable i and j.
*/
int main(){
    sum();
	return 0;
}

// //two.c
// 
// #include<stdio.h>
// extern int i; //Declaration of variable i.
// extern int j; //Declaration of variable j.
// /**
// Above two lines will search the initialization statement of variable i and j either in two.c (if initialized variable is static or extern) or one.c (if initialized variable is extern) 
// */
// void sum(){
//     int s;
//     s=i+j;
//     printf("%d",s);
// }
