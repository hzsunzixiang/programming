
template <class Type> class DblList;

template <class Type> class DblNode {
friend class DblList<Type>;
private:
    Type data;                                      //数据
    DblNode<Type> *lLink, *rLink;   //左右链指针
public:
	DblNode():data(0),lLink(NULL),rLink(NULL){}
    DblNode (Type value,DblNode<Type> *left, DblNode<Type> *right ):data (value), lLink (left), rLink (right) {data =value;lLink =left; rLink =right; } //构造函数
    DblNode (Type value ) : data (value),lLink (NULL), rLink (NULL){ }	//构造函数
};

template <class Type> class DblList {
public:
    DblList ( Type uniqueVal );//构造函数,建立头结点
    ~DblList ( );//析构函数:释放所用空间
    int Length ( ) const;
    int IsEmpty ( ) { return first->rLink == first; }//判空
    int Find ( const Type & target );//找等于给定值的结点
	void FindElement();
    Type getData ( ) const;//返回当前结点的值
    void Firster ( ) { current = first; }//当前指针指向头结点
    int First ( ); //当前指针指向头结点
    int Next ( ); //当前指针指向当前结点的直接后继
    int Prior ( ); //当前指针指向当前结点的直接前驱
    int operator ! ( ) { return current != NULL; }//重载操作符:判current是否为空       	
    void Insert ( const Type & value );	//插入新结点
	void Insert ();
	void Remove ();
	void RemoveElement();
    void Createlist( ) ;
	void MakeEmpty();
	void Output();
	Type Max();
	void MaxOfAll();
private:
    DblNode<Type> *first, *current;
};
template <class Type>  DblList<Type>::DblList(Type uniqueVal) {
	first=new DblNode<Type>(uniqueVal);
	first->rLink=first->lLink=first;
	current=NULL;
}
template <class Type>  int  DblList<Type>::Find ( const Type & target ) {
//在双向循环链表中搜索含target的结点，
//搜索成功返回1，否则返回0。
    DblNode<Type> *p = first->rLink;
    while ( p != first && p->data != target )
	  p = p->rLink;	                   //循右链搜索
    if ( p != first ) { current = p;  return 1; }//成功，返回1
    return 0;//失败，返回0
} 
template <class Type> void DblList<Type>::Insert ( const Type & value ) {
     if ( current == NULL )          //空表情形
         current = first->rLink =new DblNode<Type>(value,first,first );
     else {                                      //非空表情形
         current->rLink =new DblNode<Type>( value, current, current->rLink );
	     current = current->rLink;//新结点成为当前结点
     }
     current->rLink->lLink = current;//完成重新链接
}
template <class Type> void DblList<Type>::Insert () {
	Type m,n;
	cout<<"please enter the element you want to insert:";
	cin>>n;
	cout<<"after which element you want to  insert:";
	cin>>m;
	Find(m);
	Insert(n);
}
template <class Type> void DblList<Type>::Remove ( ) {
    if ( current != NULL ) {
        DblNode<Type> *temp = current;         //被删结点
        current = current->rLink;	      //下一结点
        current->lLink = temp->lLink;  //从链中摘下
        temp->lLink->rLink = current;
        delete temp; 		               //删去
        if ( current == first )
           if ( IsEmpty ( ) ) current = NULL;
           else  current = current->rLink;
    }
}
template <class Type> void DblList<Type>::MakeEmpty( ) {
	DblNode<Type> *q;
	while(first->rLink!=first){
		q=first->rLink;
		first->rLink=q->rLink;
		delete q;
	}
}
template <class Type> DblList<Type>::~DblList() {
	MakeEmpty();
	delete first;
}
template <class Type> void DblList<Type>::Createlist( ) {
	cout<<"How many member you will creat in the list"<<endl;
	int m;
	int i;
	Type  n;
	cin>>m;
	for(i=0;i<m;i++)
	{
		cout<<"the "<<i+1<<"th member is:"<<endl;
		cin>>n;
        Insert(n) ;
	}
	cout<<"OK"<<endl;
}
template <class Type> void DblList<Type>::Output( ) {
	DblNode<Type> *p ;
	p=first->rLink;
	if(p==first){cout<<"list empty!"<<endl;}
	else{
		cout<<"the memeber in the list"<<endl;
		while(p!=first){
			cout<<p->data<<endl;
			p=p->rLink;
		}
	}
}
template <class Type> void DblList<Type>::RemoveElement() {
	Type n;
	cout<<"please enter the element you want to remove:"<<endl;
	cin>>n;
	while(Find(n)==0){
		cout<<"the element you input doesnot exist"<<endl;
		cout<<"please enter the element you want to remove:"<<endl;
		cin>>n;}
	Remove();
}
template <class Type> void DblList<Type>::FindElement(){
	Type n;
	cout<<"enter the element you want to find:"<<endl;
	cin>>n;
	while(Find(n)==0){
		cout<<"the element you want to find doesnot exist."<<endl;
		cout<<"enter the element you want to find:"<<endl;
		cin>>n;
	}
	cout<<"the adress of the element  "<<n<<" is"<<current<<endl;
}
template <class Type> Type DblList<Type>::Max(){
	DblNode<Type> *temp;
	temp=first->rLink; 
	int max=temp->data;
	while(temp!=first){
		if(temp->data>max){max=temp->data;}
		temp=temp->rLink;
	}
	return max;
}
template <class Type> void DblList<Type>::MaxOfAll(){
	cout<<"the max of all the number is :"<<endl;
	cout<<Max()<<endl;
}







