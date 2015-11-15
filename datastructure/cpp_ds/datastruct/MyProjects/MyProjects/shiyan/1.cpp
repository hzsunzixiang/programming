class List;
class ListNode
{
friend class List;
public:
     ListNode();
	 ListNode(const Student & item);
	 ListNode * NextNoed(){return link;}
	 void InsertAfter(ListNode *p);
	 ListNode *GetNode(const Student & item,ListNode *next);
	 ListNode *RemoveAfter();
	 void print(){cout<<"学生 :"<<"     "<<data.GetName()<<"     "<<"学号"<<data.GetID()<<"     "<<"成绩"<<data.GetScore()<<endl;}
	 void New(float & n){data.score=n;}
private:
	Student data;
	ListNode *link;
};
class List
{
public:
	List(const Student & value)
	{last=first=new ListNode(value);}
	~List();
	void MakeEmpty();
	int Length() const;
	ListNode * Find( string value);
	ListNode * FindBefore( string value);
	ListNode * Find(int i);
	int Insert(Student value,int i);
	int Remove(string i);
	string  Get(int i);
	float Get2(int i);
	int Get1(int i);
private:
	ListNode * first ,* last;
};
ListNode::ListNode():link(NULL){}
ListNode::ListNode(const Student & item):data(item),link(NULL){}
void ListNode::InsertAfter(ListNode *p)
{p->link=link;}
ListNode * ListNode::GetNode(const Student & item,ListNode * next=NULL)
{
	ListNode *newnode=new ListNode(item);
	newnode->link=next;
	return newnode;
}
ListNode * ListNode::RemoveAfter()
{
	ListNode * tempptr=link;
	if(link==NULL) return NULL;
	link=tempptr->link;
	return tempptr;
}
List::~List()
{
	MakeEmpty(); delete first;
}
void List::MakeEmpty()
{
	ListNode *q;
	while(first->link!=NULL)
	{
		q=first->link;
		first->link=q->link;
		delete q;
	}
	last=first;
}
int List::Length() const
{
	ListNode *p=first->link;int count=0;
	while(p!=NULL){p=p->link;count++;}
	return count;
}
ListNode * List::FindBefore(string  value)
{
	ListNode *p=first;
	while(p!=NULL&&first->data.name!=value&&p->link->data.name!=value)  p=p->link;
    if (p->link==NULL) return NULL;
	return p; 
}
ListNode * List::Find(string  value)
{
	ListNode *p=first;
	while(p!=NULL&&p->data.name!=value)  p=p->link;
        if(p==NULL)  return NULL;
	return p; 
}
ListNode * List::Find(int i)
{
	if(i<-1) return NULL;
	if(i==-1) return first;
    ListNode *p=first->link; int j=0;
	while(p!=NULL&&j<i){p=p->link;j++;}
	return p;
}
int List::Insert(Student  value,int i)
{ 
	ListNode *p=Find(i-1);
	if(p==NULL) return 0;
	ListNode *newnode=p->GetNode(value ,p->link);
	if(p->link==NULL) last=newnode;
	p->link=newnode; 
	return 1;
	
}
int List::Remove(string va)
{
	ListNode *p=FindBefore(va), *q;
	if(p==NULL||p->link==NULL)  return 0;
	q=p->link;
	p->link=q->link;
	Student * value=new Student(q->data);
	if(q==last)last=p;
	delete q;
	return 1;
}
string  List::Get(int i)
{
	ListNode *p=Find(i);
	if(p==NULL||p==first) return NULL ;
	else return p->data.name;
}
int List::Get1(int i)
{
	ListNode *p=Find(i);
	if(p==NULL||p==first) return 0;
	else return p->data.ID;
}

float List::Get2(int i)
{
	ListNode *p=Find(i);
	if(p==NULL||p==first) return 0;
	else return p->data.score;
}
//#include<iostream>
//#include<string>
//using namespace std;
class Student      //学生的信息存储类
{
friend class ListNode; //声明ListNode类为友元类
friend class List; //声名List类为友元类
private:           //封装学生的个人信息
     string name;
     int     ID;
     float score;
public:
	Student():name(" "),ID(0),score(0){}  //无参构造函数
	Student(string m,int n,float s);      //构造函数
	Student(const Student & x);     //复制构造函数
	~Student(){}                    //析构函数 
	string GetName(){return name;}
        int GetID(){return ID;}
	float GetScore(){return score;}
	void Output();    //输出
	void Input();     //输入
};
Student::Student(const Student & x)
{
	 name=x.name;
	score=x.score;
        ID=x.ID;
}
Student::Student(string m,int n,float s)
{
	name=m;
        ID=n;
	score=s;
}
void Student::Output()
{
	cout<<"姓名："<<name<<"学号："<<ID<<"分数："<<score<<endl;
}
void Student::Input()
{
	cout<<"请输入学生的名字"<<endl;
	cin>>name;
        cout<<"请输入学生的学号"<<endl;
        cin>>ID;
	cout<<"请输入学生的分数"<<endl;
	cin>>score;
       
        
} 
#include<iostream>
//#include"student.h"
//#include"list.h"
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