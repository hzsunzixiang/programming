template <class Type> class CircList;
template <class Type> class CircListNode {
friend class CircList<Type>;
public:
	CircListNode ( Type d = 0,int f=0,CircListNode<Type> *next = NULL ) : data ( d ), flag(f),link ( next ) { }    //构造函数
private: 
     Type data;
	 int flag;
     CircListNode<Type> *link;
};
template <class Type> class CircList {
public: 
     CircList ( Type value,int index);	  //构造函数
	 CircList ( ):current(NULL),first(NULL){}
	 CircList ( Type value,int index, CircListNode<Type> *point ):data(value),flag(index),link(point){}	
	 int Createlist();//返回总人数
     Type getData ( ) const{return current->data;};	//返回密码
	 int  getFlag ( ) const{return current->flag;};	//返回编号
	 void Firster ( ) { current=first; }//置当前指针为头指针
	 void  Next ( ){current=current->link;}//将当前指针指向当前结点的后继
	 void Insert ( const Type & value,const int &index );//插入新结点
	 void Remove ( );	//删除当前结点
	 void Output();
	 void MakeEmpty();
	 void Josephus(int n,int m);
private: 
     CircListNode<Type> *first, *current, *last;
};
template <class Type> CircList<Type>::CircList ( Type value,int index ){
	first=last=new CircListNode<Type>(value,index);
	first->link=first;
	current=first;
}
template <class Type> void CircList<Type>::MakeEmpty(){
	if(first!=NULL)
	delete first;
}
template <class Type> void CircList<Type>::Insert( const Type &value ,const int &index){
	if(first==NULL){
		CircListNode<Type> *newnode=new CircListNode<Type>(value,index,NULL);		
		first=newnode;last=newnode;
		first->link=first;
		current=first;
	}
	else{
		CircListNode<Type> *newnode=new CircListNode<Type>(value,index,current->link);
		current->link=newnode;
		current=current->link;
		if(current->link==first) last=current;
	}
		

}
template <class Type> int CircList<Type>::Createlist(){
	int n,code;
	cout<<"Enter the Number of Contestant:"<<endl;
	cin>>n;	
	cout<<"please enter the code:"<<endl;
	for(int i=1;i<=n;i++){
		cin>>code;
		Insert(code,i);
	}
	return n;
}
template <class Type> void CircList<Type>::Output(){
	CircListNode<Type> *p ;
	if(first!=NULL){
		p=first;
		while(p->link!=first){
			cout<<p->data<<"    "<<p->flag<<endl;
			p=p->link;
	}
		cout<<p->data<<"   "<<p->flag<<endl;
	}
	else cout<<"链表为空"<<endl;
}

template <class Type> void CircList<Type>::Remove (){
	CircListNode<Type> *p=first ,*q=last;
	while(p->flag!=getFlag()) {q=p;p=p->link;}
	q->link=p->link;
	current=p->link;
	if(p==first) first=current;
	if(p==last)last=q;
}
template <class Type> void CircList<Type>::Josephus(int n,int m){
	cout<<"出队的顺序依次为："<<endl;
	Firster();
	Type temp;
	int count=0;
	for(int i=1;i<n;i++){	
		if(i==1){
		for(int j=1;j<m;j++)Next();				
		cout<<getFlag()<<"  ";//打印编号
		temp=getData(); //保存密码
		Remove();
		}
		else{			
			for(int j=1;j<temp;j++)Next();
			cout<<getFlag()<<"  ";//打印编号
			temp=getData();//保存密码
			Remove();
		}			
	}
		cout<<getFlag()<<"  "<<endl;//打印编号
}