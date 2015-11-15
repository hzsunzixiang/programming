#include <iostream>  
#include <string>  
using namespace std;  
  
void main(int argc,char* argv[])    
{  
    int i=0;  
    while(i<argc)  
    {  
        cout<<*argv++<<endl;//这里改写成cout<<argv[i]<<endl;也是正确的  
        i++;  
    }  
  cin.get();  
	
} 