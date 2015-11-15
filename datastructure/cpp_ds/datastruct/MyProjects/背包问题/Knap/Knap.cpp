#include<iostream.h>
int main{
	enum boolean{False,True}
	boolean Knap(int s,int n){
		if(s==0)return True;
		if(s<0||s>0&&n<1)return False;
		if(Knap(s-W[n],n-1)==Truen){cout<<W[n]<<','; return True;}
		return Knap(s,n-1);
	}
		cout<<"Input the number of Array:\n";
		cin>>ArraySize;
	for(int i=0;i<ArraySize;i++)cin>>W[i];
	Knap(51,6);
	return 0;
}