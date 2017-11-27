#include<iostream>

#include<stdlib.h>

using namespace std;

char * strcpy( char * strDest, const char * strSrc )
{

	char * strDestCopy = strDest;

	if ((NULL==strDest)||(NULL==strSrc))throw string("Invalid argument");  // 抛出一个实例  值抛出 引用接受
	//if ((NULL==strDest)||(NULL==strSrc))throw ("Invalid argument");
	//StephenSun@debian:~/programming/algrithm/mystring/strcpy$ ./main3
	//terminate called after throwing an instance of 'char const*'
	//	Aborted


	while ( (*strDest++=*strSrc++) != '\0' );

	return strDestCopy;

}

int main( int argc, char * argv[] )
{

	//char *a;
	char *a = NULL;
	char c[] = "i am teacher!";

	try{

		strcpy(a,c);
	}
	//catch(char* &strInfo)
	catch(string &strInfo) // 抛出一个实例  值抛出 引用接受
	{
		cout << "here,,,,," << endl;
		cout << strInfo << endl;
		exit(0);
	}

	cout << a << endl;

	return 0;

}
