#include<stdio.h>
int var;



//http://www.unknownroad.com/rtfm/gdbtut/gdbwatch.html
int main()
{
    int i;
    int j;
    i=1;
    j=2;
    var = 10;


    printf("%d\n",i);
    var = i+j;
    printf("%d\n",j);

    printf("%d\n",var);
    return 0;
}



//watch [-l|-location] expr [thread thread-id] [mask maskvalue]
//Set a watchpoint for an expression. GDB will break when the expression expr is written into by the program and its value changes. The simplest (and the most popular) use of this command is to watch the value of a single variable:
//
//rwatch [-l|-location] expr [thread thread-id] [mask maskvalue]
//Set a watchpoint that will break when the value of expr is read by the program.
//
//awatch [-l|-location] expr [thread thread-id] [mask maskvalue]
//Set a watchpoint that will break when expr is either read from or written into by the program.
