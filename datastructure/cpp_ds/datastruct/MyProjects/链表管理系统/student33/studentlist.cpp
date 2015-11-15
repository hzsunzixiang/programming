#include<iostream>
#include"student.h"
#include"list.h"
#include<string>
using namespace std;
int main()
{
    ListNode *search;
    Student s,s1("wuming ",0,0.0);         //定义student类
	List  l(s1);
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
				   l.Insert(s,m);
			   }
			   break;
		   case 2: 
			   s.Input();
			   cout<<"请输入你要插入的位置:"; 
			   int c;
			   cin>>c;
			   //l.Insert(s,c-1);
			   if(l.Insert(s,c-1)==0) cout<<"插入失败！"<<endl;
			    else  cout<<"插入成功！"<<endl;
			   break;
		   case 3:
			   cout<<"请输入你要删除的学生的姓名：";
			   cin>>d;
			   //l.Remove(d);
			   if(l.Find(d)==NULL) {
				   cout<<"无学生档案 删除失败"<<endl;
			       continue;
			   } 
			   if(l.Remove(d)==1) cout<<"删除成功！"<<endl;
			    break;
		   case 4:
			   cout<<"请输入你要更新的学生姓名："; 
			   cin>>d;
			   //ListNode *q;
				 // q=l.Find(d);
			   cout<<"请重新输入学生的成绩："<<endl;
			   cin>>f;
			    l.Find(d)->New(f);
			   //q->link->Student.score=f;

			   break;
		   case 6:
			   cout<<"请输入你要查找的学生姓名："<<endl;
			   cin>>d;
			   search=l.Find(d);
			   if(search==NULL) cout<<"无该学生档案！"<<endl;
			   else  search->print();
			   break;
		   case 5:
			   //cout<<l.Length()<<endl;
			   if(l.Length()==0) {cout<<"         目前无学生档案！"<<endl;}
			   for(int a=0;a<l.Length();a++)
			   {
				   cout<<"学生 "<<l.Get(a)<<endl<<"    "<<"学号"<<l.Get1(a)<<endl<<"    "<<"成绩 "<<l.Get2(a)<<endl;
			   }
			   break;
			    
		   	  
	   }
	}
	return 0; 
}