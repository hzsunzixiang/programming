#include<iostream>
#include<string>
using namespace std;
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