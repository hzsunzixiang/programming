# 1 "convention.c"
# 1 "/home/StephenSun/programming/linux/my_csapp/asm/convention_function_x86//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "convention.c"



int function3(int a, int b, int c, int d)
{
 return a+b+c*d;
}

int function2(int a, int b, int c, int d)
{
 return a+b-c*d;
}

int function1(int a, int b, int c)
{
 return function2(a, b, c, 10) + function3(c, a, b, 20);
}

int main()
{
 function1(1, 2, 3);
 return 0;
}
