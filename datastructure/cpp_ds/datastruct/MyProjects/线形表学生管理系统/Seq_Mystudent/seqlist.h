//这里不用#include<iostream.h>等
#include<stdlib.h>
class seqlist
{
private:
   Student *data;              //顺序表的存放数组
   int	maxsize;           //顺序表的最大可容纳项数
   int  last;                  //当前已存表项的最后位置
public:
    seqlist(int maxsize);
    ~seqlist(){delete[] data;}
	int Length()const{return last+1;}
	void Creatlist();
	int Insert(Student value,int i);
	int Find(string value);
	int Remove(string value);
	string  Getname(int i);
	int GetID(int i);
	float Getscore(int i);
	void output();
	void Insertlist();
	void Removelist();
	void New(float & n,int i){data[i].score=n;}
	void print(int i){cout<<"学生 :"<<"     "<<data[i].GetName()<<"     "<<"学号"<<data[i].GetID()<<"     "<<"成绩"<<data[i].GetScore()<<endl;}
};
seqlist::seqlist(int sz)
{
    if (sz>0)
       {  maxsize=sz;last=-1;
           data=new Student[maxsize];
           if (data==NULL)
              {cerr<<"内存溢出"<<endl;exit(1);}
         }
}
int seqlist::Insert(Student value,int i)
{ 
	if(i<0||i>last+1||last==maxsize-1) return 0;
	else{
		last++;
			for(int j=last;j>i;j--) data[j]=data[j-1];
			data[i]=value;
			return 1;
	}
	
}

int seqlist::Remove(string value)
{
	int i=Find(value);
	if(i!=-1){
		last--;
		for(int j=i;j<=last;j++)data[j]=data[j+1];
		return 1;
	}
	return 0;

}
int seqlist::Find(string value)
{
	int i=0;
	while(i<=last&&data[i].name!=value) i++;
	if(i>last) return -1;
	else return i;
}
string seqlist::Getname(int i)
{
	if(i<0||i>last) return 0;
	else return data[i].name;
}
int seqlist::GetID(int i)
{
	if(i<0||i>last) return 0;
	else return data[i].ID;
}

float seqlist::Getscore(int i)
{	
	if(i<0||i>last) return 0;
	else return data[i].score;
}

void seqlist::output(){
	if(this->Length()==0) {cout<<"         目前无学生档案！"<<endl;}
	for(int a=0;a<this->Length();a++)
	{
		cout<<"学生 "<<this->Getname(a)<<endl<<"    "<<"学号"<<this->GetID(a)<<endl<<"    "<<"成绩 "<<this->Getscore(a)<<endl;
	   }
}
void seqlist::Creatlist(){
		Student s;  
	    cout<<"请输入你要建立的表格元素的个数为：";
	   int n,m;	    		
	   cin>>n; 
	   for(m=0;m<n;m++)
	   {
		   s.Input();
		   this->Insert(s,m);
	   }
}
void seqlist::Insertlist(){
	Student s;
	s.Input();
	cout<<"请输入你要插入的位置:"; 
	int c;
	cin>>c;
	if(this->Insert(s,c)==0) cout<<"插入失败！"<<endl;
	else  cout<<"插入成功！"<<endl;
}













