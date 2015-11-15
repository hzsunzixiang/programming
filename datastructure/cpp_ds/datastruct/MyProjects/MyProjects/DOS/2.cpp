#include<iostream> 
using namespace std;

int main(int argc, char *argv[])
{
char Sentence[40];
strcpy(Sentence, argv[1]);

cout << "You typed " << Sentence<< endl;
return 0;
}
//在dos下输入 CL 2.CPP  
//然后 输入 2 www.czvc.com
/* 然后再CL 2.cpp编译后输入指令main www.czvc.com回车后有：
D:\MyProgram2\AConsoleApp>2 www.czvc.com
You typed www.czvc.com
*/