template <class Type> class CircList;
template <class Type> class CircListNode {
friend class CircList<Type>;
public:
	CircListNode ( Type d = 0,CircListNode<Type> *next = NULL ) :
                data ( d ), link ( next ) { }    //构造函数
private: 
     Type data;
     CircListNode<Type> *link;
};
template <class Type> class CircList {
public: 
     CircList ( Type value );	  //构造函数
	 CircList ( Type value,CircListNode<Type> *point ):data(value),link(point){}
     ~CircList ( );			//析构函数	
     Type getData ( ) const{return current->data;};	//返回当前结点值
	 void Firster ( ) { current = first; }//置当前指针为头指针
	 void  Next ( ){current=current->link;}//将当前指针指向当前结点的后继
	 void Insert ( const Type & value );//插入新结点
	 void Remove ( );	//删除当前结点
	 void Output();
	 void MakeEmpty();
	 void Josephus(int n,int m);
private: 
     CircListNode<Type> *first, *current, *last;
};
template <class Type> CircList<Type>::CircList ( Type value ){
	first=last=new CircListNode<Type>(value);
	first->link=first;current=NULL;
}
template <class Type> void CircList<Type>::MakeEmpty(){
	CircListNode<Type> *q;
	while(first->link!=first){
		q=first->link;
		first->link=q->link;
		delete q;
	}
}
template <class Type> CircList<Type>::~CircList (){
		MakeEmpty();
		delete first;
}
template <class Type> void CircList<Type>::Insert( const Type &value ){
	if(current==NULL)
		current=first->link=new CircListNode<Type>(value,first);
	else{
		CircListNode<Type> *newnode=new CircListNode<Type>(value,current->link);		
		if(current->link=first) last=newnode;
		current->link=newnode;
		current=current->link;
	}
}
template <class Type> void CircList<Type>::Output(){
	CircListNode<Type> *p ;
	p=first;
		while(p->link!=first){
			cout<<p->data<<endl;
			p=p->link;
	}
		cout<<p->data<<endl;
}

template <class Type> void CircList<Type>::Remove ( ){
	CircListNode<Type> *p=first ,*q=last;
	while(p->data!= getData ()) {q=p;p=p->link;}
	current=q->link=p->link;
	if(p==first) first=current;
	if(p==last)  last=q;
}
template <class Type> void CircList<Type>::Josephus(int n,int m){
	Firster();
	cout<<"the sequence of Deleting  person"<<endl;
	for(int i=0;i<n;i++){
		for(int j=0;j<m-1;j++)Next();
		if(i!=n-1){
			cout<<getData()<<"  ";
			Remove();
			if(i%20==0) cout<<endl;
		}		
		else{
			cout<<endl<<endl<<"the person left:"<<getData()<<endl;
		}
	}
}