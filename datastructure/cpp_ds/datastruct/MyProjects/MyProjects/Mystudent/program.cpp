#include<iostream>
#include"student.h"
#include"seqlist.h"
#include<string>
using namespace std;
int main()
{
    seqlist <Student> list(10);
	ListNode *search;
    Student s;         //定义student类
    string d;  float f;
    cout<<"******************************"<<endl;   
	cout<<"*请选择你所需要的服务        "<<endl;
	cout<<"*建立表格请按‘1’键         "<<endl;
	cout<<"*插入新成员请按‘2’键       "<<endl;
	cout<<"*删除请按‘3’键             "<<endl;
	cout<<"*更新请按‘4’键             "<<endl;
	cout<<"*输出请按‘5’键             "<<endl;
	cout<<"*查找个人信息请按‘6’键     "<<endl;
	cout<<"*退出请按‘0’键             "<<endl;
	cout<<"******************************"<<endl;
	int i;
	while(i!=0)
	{  
		cout<<"请输入你的选择：";
		cout<<"1---> 建立、2----插入、3----删除、4--->更新、5--->输出、6-->查找、0-->退出"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			   cout<<"请输入你要建立的表格元素的个数为：";
			   int n,m;	    
			   cin>>n; 
			   for(m=0;m<n;m++)
			   {
				   s.Input();
				   list.insert(s,m);
			   }
			   break;
		   case 2: 
			   s.Input();
			   cout<<"请输入你要插入的位置:"; 
			   int c;
			   cin>>c;
			   if(list.insert(s,c-1)==0) cout<<"插入失败！"<<endl;
			    else  cout<<"插入成功！"<<endl;
			   break;
		   case 3:
			   cout<<"请输入你要删除的学生的姓名：";
			   cin>>d;
			   if(list.find(d)<0) {
				   cout<<"无学生档案 删除失败"<<endl;
			       continue;
			   } 
			   if(list.remove(d)==1) cout<<"删除成功！"<<endl;
			    break;
		  // case 4:
			 //  cout<<"请输入你要更新的学生姓名："; 
			 //  cin>>d;
			 //cout<<"请重新输入学生的成绩："<<endl;
			  // cin>>f;
			    //l.Find(d)->New(f);


			   //break;
		   //case 6:
			 //  cout<<"请输入你要查找的学生姓名："<<endl;
			  // cin>>d;
			   //search=l.find(d);
			   //if(search==NULL) cout<<"无该学生档案！"<<endl;
			   //else  search->print();
			   //break;
		   case 5:
			   //cout<<l.Length()<<endl;
			   if(list.getlast()<0) {cout<<"         目前无学生档案！"<<endl;}
			   for(int a=0;a<list.getlast;a++)
			   {
				   cout<<"学生 "<<list.getlast()<<endl<<"    "<<"学号"<<l.Get1(a)<<endl<<"    "<<"成绩 "<<l.Get2(a)<<endl;
			   }
			   break;
			    
		   	  
	   }
	}
	return 0; 
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
               //for(i=0;i<=list.getlast();i++){
	              //cout<<list.getdata(i)<<endl;}
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
	                cout<<list.getdata(i).GetName()<<list.getdata(i).GetID()<<list.getdata(i).GetName()<<endl;}
		   	  
	   }
	}

}
	return 0; 
}

int List::Get1(int i)
{
	if(p==NULL||p==first) return 0;
	else return p->data.ID;
}

float List::Get2(int i)
{
	ListNode *p=Find(i);
	if(p==NULL||p==first) return 0;
	else return p->data.score;
}