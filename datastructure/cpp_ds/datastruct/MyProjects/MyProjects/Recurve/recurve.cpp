#include<iostream.h>
class RecurveArray{
private:
	int *Elements;
	int ArraySize;
	int CurrentSize;
	int MaxSize;
public:
    RecurveArray(int MaxSize=10):ArraySize(MaxSize),Elements(new int[MaxSize]){}
	~RecurveArray(){delete[]Elements;}
	void InputArray();
	int MaxKey(int n);
	int Sum(int n);
	float Average(int n);
};
void RecurveArray::InputArray(){
	cout<<"Input the number of Array:\n";
		cin>>ArraySize;
	for(int i=0;i<ArraySize;i++)cin>>Elements[i];
}
int RecurveArray::MaxKey(int n){
	if(n==1)return Elements[0];
	int temp=MaxKey(n-1);
	if(Elements[n-1]>temp)return Elements[n-1];
	else return temp;
}
int RecurveArray::Sum(int n){
	if(n==1)return Elements[0];
	else return Elements[n-1]+Sum(n-1);
}
float RecurveArray::Average(int n){
	if(n==1)return(float)Elements[0];
	else return((float)Elements[n-1]+(n-1)*Average(n-1))/n;
	}
int main(int argc,char *argv[]){
	int size=1;
	cout<<"NO.of the Elements:";
	while(size<=1)cin>>size;
	RecurveArray ra(size);
	ra.InputArray();
	cout<<"\nThe max is :"<<ra.MaxKey(size)<<endl;
	cout<<"\nThe sum is:"<<ra.Sum(size)<<endl;
	cout<<"\nThe aver is :"<<ra.Average(size)<<endl;
	return 0;
}


