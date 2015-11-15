#include <iostream.h>
#include<stdlib.h>
#include"stack.h"
int main()
{
	Stack<char> stack;	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*establish a stack,enter'1' "   <<endl;
	cout<<"*output                 '2'  "<<endl;
	cout<<"*quit,enter              '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
	do
	{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2---output¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  	cout<<"create a stack"<<endl;
				cout<<"end with q:"<<endl;
				char s;
				cin>>s;
				int k;
				k=0;
		        while(s!='q'){			
					stack.Push(s);
					if(s=='(') k++;
					else if(s==')') k--;
					cin>>s;
				}
				if(k==0)cout<<"match success!"<<endl;
				else cout<<"Error! match failing!"<<endl;
			break;
		   case 2:
               stack.Output();
			   break;
	   }	   
	   }while(i!=0);
			return 0;
	
}




