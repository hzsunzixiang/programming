#include <iostream>
using namespace std;

int main()
{
	cout << "\nC++ is Fun!!!\n";
	return 0;
}


/*==========================================================================
int main(int argc, char *argv[])
{
	double Operand1, Operand2, Addition;

	Operand1 = atoi( argv[1] );
	Operand2 = atoi( argv[2] );
	Addition = Operand1 + Operand2;

	cout << "\nFirst Number:  " << Operand1;
	cout << "\nSecond Number: " << Operand2 << endl;
	cout << Operand1 << " + " << Operand2 << " = " << Addition << endl;

	return 0;
}
=============================================================================*/
/*==============================================
int main(int argc, char *argv[])
{
	char Sentence[40];
	strcpy(Sentence, argv[1]);

	cout << "You typed " << Sentence<< endl;
	return 0;
}
==============================================*/
/*==================================================================================
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
		strcpy(strGender, "Unknown Gender");

	cout << "Employee Information";
	cout << "\nFull Name: " << FullName;
	cout << "\nGender:    " << strGender;
	cout << "\nSalary:    " << Salary << endl;
	return 0;
}
==================================================================================*/