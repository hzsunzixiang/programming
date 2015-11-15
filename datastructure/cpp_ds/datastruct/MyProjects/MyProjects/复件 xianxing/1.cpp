#include <iostream.h>
#include<stdlib.h>
#include"student.h"
class seqlist
{
private:
   student *data;              //顺序表的存放数组
   int  maxsize;           //顺序表的最大可容纳项数
   int  last;                  //当前已存表项的最后位置
public:
    seqlist(int maxsize);
    ~seqlist(){delete[] data;}
    int  length()const {return last+1;}   //计算表长
    void  create(int i);
    int find (type &x) const;                //定位函数：找x在表中的位置
    int  isin (type &x);                        //判断X在表中，与find()有区别
    int getlast(){return last;};
    student getdata(int i){return i<0||i>last?NULL:data[i];}//取数据
    int insert(student x,int i);                       //在表中第i个位置处插入X
    int remove(student &x);               //删除X
    int next(){return current<last?&data[++current]:NULL;} //找x的后继
    int prior(){return current>0?&data[--current]:NULL;}  //找出x的前驱
    int isempty(){return last = = -1;}  // 判空
    int isfull(){return last==maxsize-1;}  // 判满
};
seqlist::seqlist(int sz)
{
    if (sz>0)
       {  maxsize=sz;last=-1;
           data=new student[maxsize];
           if (data==NULL)
              {cerr<<"内存溢出"<<endl;exit(1);}
         }
}
int seqlist::find(student &x)const 
{ 
	int i=0;
	while(i<=last&&data[i]!=x) i++;
	if(i>last) return -1;
	else return i;
}
int  seqlist::insert(student x,int i)
{
	if(i<0||i>last+1||last==maxsize-1) return 0;
	else
	{
		last++;
		for(int j=last;j>i;j--) data[j]=data[j-1];
		data[i]=x;return 1;
	}
}
int  seqlist::remove(student &x)
{
    int  i=find(x);
    if(i>=0)
	{
	last--;
      for(int j=i;j<=last;j++)data[j]=data[j+1];
     return 1;
      }
   return   0;
}
int seqlist::isin(student &x){
	int i=0,found=0;
	while(i<=last&&!=found)
		if(data[j]!=x) i++;
		else found=1;
	return found;
}
int main()
{
	seqlist <int> list(10);	 
	return 0;
}
/*	void seqlist<student>::create(int i)
{
	type x;
	for(int j=0;j<i;j++)
	{
		cout<<"这是第"<<j+1<<"个"<<endl;
		cin>>x;
		data[j]=x;
		last++;
	}
}
	{
    cout<<"******************************"<<endl;   
	cout<<"*请选择你所需要的服务        "<<endl;
	cout<<"*建立表格请按‘1’键         "<<endl;
	cout<<"*插入新成员请按‘2’键       "<<endl;
	cout<<"*删除请按‘3’键             "<<endl;
	cout<<"*查找信息请按‘4’键     "<<endl;
	cout<<"*输出请按‘5’键             "<<endl;
	cout<<"*退出请按‘0’键             "<<endl;
	cout<<"******************************"<<endl;
	int i;
	while(i!=0)
	{  
		cout<<"请输入你的选择：";
		//cout<<"1---> 建立、2----插入、3----删除、4--->更新、5--->输出、6-->查找、0-->退出"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			   cout<<"请输入你要建立的表格元素的个数为：";
			   int n;	    
			   cin>>n; 
               list.create(n);
			   break;
		   case 2: 
			   cout<<"请输入你要插入的位置和值:"; 
			   int c;
			   int v;
			   cin>>c;
			   cin>>v;
			   if(list.insert(v,c)==0) cout<<"插入失败！"<<endl;
			      else  cout<<"插入成功！"<<endl;
			   break;
		   case 3:
			   cout<<"请输入要删除的数据：";
			   int d;
			   cin>>d;
			   if(list.find(d)==-1) {
				   cout<<"无学生档案 删除失败"<<endl;
			       continue;
			   } 
			   if(list.remove(d)==1) cout<<"删除成功！"<<endl;
			    break;
		   case 4:
			   cout<<"请输入你要查找的数据："<<endl;
			   cin>>d;
			   int search;
			   search=list.find(d);
			   if(search==-1) cout<<"无该学生档案！"<<endl;
			   else  cout<<list.getdata(search)<<endl;
			   break;
		   case 5:
			   //cout<<l.Length()<<endl;
			   if(list.getlast()<0) {cout<<"         目前无学生档案！"<<endl;}
			   for(i=0;i<=list.getlast();i++){
	                cout<<list.getdata(i)<<endl;}
		   	  
	   }
	}

}
	return 0; 
}*/