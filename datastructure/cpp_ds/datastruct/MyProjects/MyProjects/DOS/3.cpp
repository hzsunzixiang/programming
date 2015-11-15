#include<iostream>
using namespace std;

int main(int argc, char *argv[])
{
double Operand1, Operand2, Addition;

Operand1 = atoi( argv[1] );
Operand2 = atoi( argv[2] );
Addition = Operand1 + Operand2;

cout << "\nFirst Number: " << Operand1;
cout << "\nSecond Number: " << Operand2 << endl;
cout << Operand1 << " + " << Operand2 << " = " << Addition << endl;

return 0;
}
/*保存文件，关闭VC工程，在命令行下输入CL 3.cpp回车，这时生成了新的main.exe程序，再在命令行输入main 48.52 1205回车，你会看到如下运行结果：
D:\MyProgram2\AConsoleApp>3  48.52 1205

First Number: 48
Second Number: 1205
48 + 1205 = 1253

D:\MyProgram2\AConsoleApp>
*/