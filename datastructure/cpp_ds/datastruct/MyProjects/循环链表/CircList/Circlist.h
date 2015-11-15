enum Boolean{False,True};
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
     int Length ( ) const;      //计算链表长度
     int IsEmpty ( ) { return first->link == first; } //判空
     Boolean Find ( const Type & value );//查找
	 Boolean FindBefore(const Type &value);//把值为value的前一个结点指针作为current
     Type getData ( ) const;	//返回当前结点值
	 void Firster ( ) { current = first; }//置当前指针为头指针
	 Boolean First ( ); //将当前指针指向第一个结点
	 Boolean Next ( );//将当前指针指向当前结点的后继
	 Boolean Prior ( );	//将当前指针指向当前结点的前驱
	 void Insert ( const Type & value );//插入新结点
	 void Insert();
	 void Remove ( );	//删除当前结点的下一结点
	 void CreatList();
	 void Output();
	 void MakeEmpty();
	 void RemoveElem();//删除指定的结点
	 void FindElement();
	 Type Max();
	 void MaxOfAll();
private: 
     CircListNode<Type> *first, *current, *last;
};
template <class Type> CircList<Type>::CircList ( Type value ){
	first=last=new CircListNode<Type>(value);
	first->link=first;current=NULL;
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
template <class Type> void CircList<Type>::CreatList(){
	Type n;
	int m;
	cout<<"please enter the number of the element you want to creat:"<<endl;
	cin>>m;
	for(int i=0;i<m;i++){
		cout<<"enter the element you want to insert:"<<endl;
		cin>>n;
		Insert(n);
	}
}
template <class Type> void CircList<Type>::Output(){
	CircListNode<Type> *p ;
	p=first->link;
	if(p==first){cout<<"list empty!"<<endl;}
	else{
		cout<<"the memeber in the list"<<endl;
		while(p!=first){
			cout<<p->data<<endl;
			p=p->link;
		}
	}
}
template <class Type> void CircList<Type>::Insert(){
	Type value,elem;
	cout<<"please enter the element you want to insert:"<<endl;
	cin>>value;
	cout<<"after which element you want to insert:"<<endl;
	cin>>elem;
	while(Find(elem)==False){
		cout<<"the element you want to find doesnot exist."<<endl;
		cout<<"enter the element you want to find:"<<endl;
		cin>>elem;
	}
	Insert(value);
}
template <class Type> Boolean CircList<Type>::Find ( const Type & value ){
	CircListNode<Type> *p=first->link;
	while(p!=first&&p->data!=value) p=p->link;
	if(p!=first){current=p;return True;}
	return False;
}
template <class Type> Boolean CircList<Type>::FindBefore( const Type & value ){
	CircListNode<Type> *p=first;
	while(p->link!=first&&p->link->data!=value) p=p->link;
	if(p->link!=first){current=p;return True;}
	return False;
}
template <class Type> void CircList<Type>::Remove ( ){
	if ( current != NULL ) {
        CircListNode<Type> *temp = current,*temp1= current->link;        //
        current = current->link->link;	      //下一结点
		temp->link=current;
        delete temp1; 		               //删去
        if ( current == first )
           if ( IsEmpty ( ) ) current = NULL;
           else  current = current->link;
    }
}
template <class Type> void CircList<Type>::RemoveElem ( ){
	Type n;
	cout<<"please enter the element you want to remove:"<<endl;
	cin>>n;
	while(FindBefore(n)==False){
		cout<<"the element you input doesnot exist"<<endl;
		cout<<"please enter the element you want to remove:"<<endl;
		cin>>n;}
	Remove();
}
template <class Type> void CircList<Type>::MakeEmpty(){
	CircListNode<Type> *q;
	while(first->link!=first){
		q=first->link;
		first->link=q->link;
		delete q;
	}
}
template <class Type> void CircList<Type>::FindElement(){
	Type n;
	cout<<"enter the element you want to find:"<<endl;
	cin>>n;
	while(Find(n)==False){
		cout<<"the element you want to find doesnot exist."<<endl;
		cout<<"enter the element you want to find:"<<endl;
		cin>>n;
	}
	cout<<"the adress of the element  "<<n<<" is"<<current<<endl;
}
template <class Type> Type CircList<Type>::Max(){
	CircListNode<Type> *temp;
	temp=first->link; 
	int max=temp->data;
	while(temp!=first){
		if(temp->data>max){max=temp->data;}
		temp=temp->link;
	}
	return max;
}
template <class Type> void CircList<Type>::MaxOfAll(){
	cout<<"the max of all the number is :"<<endl;
	cout<<Max()<<endl;
}

