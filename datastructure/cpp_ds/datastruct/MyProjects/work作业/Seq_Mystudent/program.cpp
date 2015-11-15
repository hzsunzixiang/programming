#include<iostream>
#include"student.h"
#include"seqlist.h"
#include<string>
using namespace std;
void main()
{
    seqlist  list(10);
	Student s;
	string d;
	float f;
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
	do
	{  
		cout<<"请输入你的选择：";
		cout<<"1---> 建立、2----插入、3----删除、4--->更新、5--->输出、6-->查找、0-->退出"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  list.Creatlist();		   
			   break;
		  case 2: 
			  list.Insertlist();
			  break;
		  case 3:
			  cout<<"请输入你要删除的学生的姓名：";
			  cin>>d;
			  if(list.Find(d)==-1) {
				  cout<<"无学生档案 删除失败"<<endl;
				  continue;
			  } 
			  if(list.Remove(d)==1) cout<<"删除成功！"<<endl;
			  break;
		  case 4:
			  cout<<"请输入你要更新的学生姓名："; 
			  cin>>d;
			  cout<<"请重新输入学生的成绩："<<endl;
			  cin>>f;
			  list.New(f,list.Find(d));		  
			   break;
		  case 5:
			  list.output();
			   break;
		  case 6:
			  cout<<"请输入你要查找的学生姓名："<<endl;
			  cin>>d;
			  if(list.Find(d)==-1) cout<<"无该学生档案！"<<endl;
			  else  list.print(list.Find(d));
			  break;
	   }
	}while(i!=0);

}
	
