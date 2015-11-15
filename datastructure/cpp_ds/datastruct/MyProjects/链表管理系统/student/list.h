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
