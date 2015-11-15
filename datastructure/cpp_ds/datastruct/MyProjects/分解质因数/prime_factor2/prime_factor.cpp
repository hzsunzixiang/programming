#include<iostream.h>
#include<stdlib.h>
int main()
{
    int Int,*temp1,*temp2;
	int count=-1;
	temp1=new int[100];
	temp2=new int[100];
	for(int i=0;i<100;i++){
		temp1[i]=0;
		temp2[i]=0;
	}
	cout<<"please enter an long integer!:";
	cin>>Int;
	int temp=Int;
	cout<<Int<<"is divided into"<<endl<<endl<<Int<<'=';
	for(i=2;i<=Int;i++)
	{
		if(temp%i==0){count++;}
		while(temp%i==0){
			 temp1[count]=i;
			 temp2[count]=temp2[count]+1;
			 temp=temp/i;
			 if(count==0&&temp2[0]==1){
				 cout<<i;}
			 else
			 cout<<'*'<<i;
		}
	}

	/*for(i=0;i<=count;i++)
		for(int j=0;j<temp2[i];j++){
			if(i==0&&j==0){
				cout<<temp1[i];
			}
			else{
			cout<<'*'<<temp1[i];
			}
		}*/
    cout<<endl<<endl;
	return 0;
}
