#include<iostream.h>
class List;
class ListNode{
	friend class List;
private:
	int data;
	ListNode *link;
public:
	ListNode(const int item):data(item),link(NULL){}
};
class List{
private:
	ListNode *first,current;
	int Max(ListNode *f);
	int Num(ListNode *f);
	float Avg(ListNode *f,int &n);
public:
	List():first(NULL),current(NULL){}
	~List(){}
	ListNode *NewNode(const int item);
	void NewList(const int retvlaue);
	void PrintList();
	int GetMax()                  {return Max(first);}
	int GetNum()                   {return Num(first);}
	float GetAvg()                 {return Avg(first,n);}
};
ListNode *List::NewNode(const int item){
	ListNode *newnode=new ListNode(item);
	return newnode;
}
void List::NewList(const int retvalue){
	first=NULL;
	int value;
	ListNode *q;
	cou<<"Input you data:\n";
	cin>>value;
	while(value!==retvalue){
		q=NewNode(value);
		if(first==NULL)first=current=q;
		else{curren->link=q;current=q;}
		cin>>value;
	}
	void List::PrintList(){
		cout<<"\nThe List is:\n";
		ListNode *p=first;
		while(p!=NULL){cout<<p->data<<'';p=p->link;}
		cout<<'\n';
	}
	int List::Max(ListNode *f){
		if(f->link==NULL)return f->data;
		int temp=Max(f->link);
		if(f->data>temp)return f->data;
		else return temp;
	}
	int List::Num(ListNode *f){
		if(f==NULL)return 0;
		return 1+Num(f->link);
	}
	float List::Avg(ListNode *f,int &n){
		if (f->link==NULL){
			n=1;return(float)(f->data);}
		else {float Sum=Avg(f->link.n)*n;
		n++;
		return(f->data+Sum)/n
		}
	}

