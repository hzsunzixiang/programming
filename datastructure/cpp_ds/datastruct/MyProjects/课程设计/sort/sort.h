#include<iostream>
using namespace std;
class Sort;          //前视类定义
class Datalist         //数组类的定义
{
public:
	friend class Sort;
	Datalist(int n,int *a);
private:
	int currentsize;
	int *vector;
};
class Sort
{
public:
	Sort()
	{
	a=NULL;
	}
	Sort(Datalist *arr);        //构造函数，arr数组的首地址
	~Sort();                      //析构函数
    void insertsort(Datalist &list);    //插入排序
	void bubblesort(Datalist &list);               //起泡排序
	void output(Datalist &list);
private:
	Datalist *a;
	void insert(Datalist &list,int i);//在前面个数据排列好后用比较大小的方式将第个数据插入数组中形成一组有顺序的队列
	void bubble(Datalist &list,const int i,int &exchange);
	 
};
Datalist::Datalist(int n,int *a)
{  
  currentsize=n;
  vector=a;
}
Sort::Sort(Datalist arr[])
{
	a=arr;
}
Sort::~Sort()
{
delete []a;
}
void Sort::insertsort(Datalist &list)//按关键码递增的顺序对数组排序
{
   for(int j=0;j<list.currentsize;j++)
	   insert(list,j);
}
void Sort::insert(Datalist &list,int i)
{
	int temp=list.vector[i];
	int j=i;
	while (j>0&&temp<list.vector[j-1])
   {
     list.vector[j]=list.vector[j-1];j--;
   }
   list.vector[j]=temp;
}
void Sort::output(Datalist &list){
	cout<<"the element in the list after sorting  is :"<<endl;
	for(int i=0;i<list.currentsize;i++){
		cout<<list.vector[i]<<"     ";
	}
	cout<<endl;
}

void Sort::bubble(Datalist &list,const int i,int &exchange)
{
	exchange=0;
	int temp;
	for(int j=list.currentsize-1;j>=i;j--)
		if(list.vector[j-1]>list.vector[j]){
			temp=list.vector[j];
			list.vector[j]=list.vector[j-1];
			list.vector[j-1]=temp;
			exchange=1;
		}

}
void Sort::bubblesort(Datalist &list)
{
	int pass=1;int exchange=1;
	while(pass<list.currentsize&&exchange){
		bubble(list,pass,exchange);
		pass++;
	}
}
