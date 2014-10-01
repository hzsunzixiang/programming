

#include<stdio.h>

void print(int n,char * n1,...);


int main()
{
	char xx[]="hello";
	char xx1[]="hello1";
	char xx2[]="hello2";
	char xx3[]="hello3";
	int n=1;
	int n1=12;
	print(4,xx,xx1,xx2,xx3);
	return 0;
}


void print(int n,char *c1,...)
{

	char **p=&c1;
    int i;

	for(i=1;i<=n;i++)
	{
	
		printf("%s\t address %x\n", *p++, (long long)p);
	}


}


