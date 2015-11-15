#include<iostream>
using namespace std;
int main(int argc, char *argv[])
{
char FullName[40], strGender[20];
char cGender[10];
float Salary;

strcpy(FullName, argv[1]);
Salary = atof(argv[2]);
strcpy(cGender, argv[3]);

if( cGender == "m" || cGender == "M" )
strcpy(strGender, "Male");
else if( cGender == "f" || cGender == "F" )
strcpy(strGender, "Female");
else
strcpy(strGender, "shima");

cout << "Employee Information";
cout << "\nFull Name: " << FullName;
cout << "\nGender: " << strGender<<cGender;
cout << "\nSalary: " << Salary << endl;
return 0;
}
/*然后再CL 1.cpp编译后输入指令1 "WWW.CZVC.COM, LOOMMAN NETWORKS" 18.52 "M"回车后有：
D:\MyProgram2\AConsoleApp>1 "WWW.CZVC.COM, LOOMMAN NETWORKS" 18.52 "M"
Employee Information
Full Name: WWW.CZVC.COM, LOOMMAN NETWORKS
Gender: Unknown Gender
Salary: 18.52

D:\MyProgram2\AConsoleApp>
*/

