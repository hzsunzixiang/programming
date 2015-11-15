template <class Type> class List;//类的前视定义	

template <class Type> class ListNode {   //链表结点类的定义
friend class List<Type>;//List类作友类定义
    Type data;                        //结点数据域 
    ListNode<Type> *link;    //结点链接指针域
public:
    ListNode ( );               //链表结点构造函数（不含数据）
    ListNode ( const Type& item );//给数据的构造函数
    ListNode<Type> *NextNode ( ) { return link; }
    //给出当前结点的下一结点（即直接后继）的地址
ListNode<Type> *GetNode ( const Type& item, ListNode<Type> *next ); //创建数据为item，指针为next的新结点
     void InsertAfter ( ListNode<Type> *p );
      //在当前结点后插入p所指的结点
     ListNode<Type> *RemoveAfter ( );
     //在链中摘下当前结点的下一结点
};

template <class Type> class List {
    ListNode<Type> *first, *last;//表头、表尾指针		
public:
	List ( ) :first(NULL),last(NULL){}
    List ( const Type & value ) 
   { 
        last =first = new ListNode<Type>( value );
    }    	                                  //构造函数
    ~List ( );		            //析构函数
    void MakeEmpty ( );        //链表置空
    int Length ( ) const;        //求链表长度
   // ListNode<Type> *Find ( Type value ); //找含数据value的结点
    ListNode<Type> *Find ( int i ); //搜索第i个元素的地址
	void Createlist( ) ;
    int Insert ( Type value, int i ); //将新元素value插到第i个位置
	void Output();
    Type *Remove ( int i ); //将第i个元素删除
    Type *Get ( int i ); //取出第i个元素
};
template <class Type>ListNode<Type> :: ListNode ( ) : link (NULL) { }//仅初始化指针成员

template <class Type>ListNode<Type>::ListNode( const Type& item ) :data (item), link (NULL) { } //初始化数据与指针成员

template <class Type> void ListNode<Type>::InsertAfter ( ListNode<Type> *p )
{ p->link = link;  link = p; }//将P指针指向结点插入到当前结点后

template <class Type> ListNode<Type>*ListNode<Type>::GetNode ( const Type& item,  ListNode<Type> *next = NULL )  {
//以给定的参数建立新结点，返回新结点指针
     ListNode<Type> *newnode =new ListNode<Type> ( item );
      newnode ->link = next;	
      return newnode;
}

template <class Type> ListNode<Type>*ListNode<Type>::RemoveAfter ( ) {
//摘下当前结点的下一结点
ListNode<Type> *tempptr = link;	
     if ( link == NULL ) return NULL;
     //没有下一结点则返回空指针
     link = tempptr->link;	   //重新链接		
     return tempptr;            
     //返回下一结点地址
}

template <class Type> List<Type> :: ~List ( ){
//析构函数 (链表的公共操作)
     MakeEmpty ( );  delete first;
     //链表置空，再删去表头结点
}
template <class Type> void List<Type> :: MakeEmpty ( ) {
//删去链表中除表头结点外的所有其他结点
    ListNode<Type> *q;
    while ( first->link != NULL ) {
         q = first->link;  first->link = q->link;
         //将表头结点后第一个结点从链中摘下
         delete q;        //释放它 
    }
    last = first;         //修改表尾指针
}
template <class Type> int List<Type>::Length ( ) const {
//求单链表的长度
     ListNode<Type> *p = first->link;
     //检测指针p指示第一个结点
     int count = 0; 
     while ( p != NULL ) {      //逐个结点检测
          p = p->link;  count++;
     }			
     return count;
}
/*template <class Type> ListNode<Type>*List <Type>::Find ( Type value ) {
//在链表中从头搜索其数据值为value的结点 
     ListNode<Type> *p = first->link;
     //检测指针 p 指示第一个结点
     while ( p != NULL && p->data != value )  
	p = p->link;
     return p;  // p 在搜索成功时返回找到的结点地址
                      // p 在搜索不成功时返回空值
}*/
template <class Type> ListNode<Type> *List<Type> :: Find ( int i ) {
//在链表中从头搜索第 i 个结点，不计头结点
     if ( i < -1 ) return NULL;			
     if ( i == -1 ) return first;	         // i 应 ? 0
     ListNode<Type> *p = first->link;  
     int j = 0;		
     while ( p != NULL && j < i )          // j = i 停
 	  { p = p->link; j++; }	
     return p;				
}
template <class Type> int List<Type> :: Insert ( Type value, int i ) {
//将含value的新元素插入到链表第 i 个位置
    ListNode<Type> *p = Find ( i-1 );
    // p 指向链表第 i-1个结点
    if ( p == NULL ) return 0;
    ListNode<Type> *newnode =p->GetNode ( value, p->link );//创建结点
    if ( p->link == NULL ) last = newnode;
    p->link = newnode;                    //重新链接
    return 1;
}
template <class Type> Type *List<Type>::Remove ( int i ) {
//从链表中删去第 i 个结点
     ListNode<Type> *p = Find (i-1), *q;
     if ( p == NULL || p->link == NULL )
          return NULL;	
     q = p->link;  p->link = q->link;    //重新链接
     Type *value = new Type ( q->data );
     if ( q == last ) last = p;
     delete q;
     return value;
}
template <class Type> Type *List<Type>::Get ( int i ) {
//提取第 i 个结点的数据
     ListNode<Type> *p = Find ( i );
     // p 指向链表第 i 个结点
     if ( p == NULL || p == first )
         return NULL;		
     else return p->data;
}
template <class Type> void List<Type>::Createlist( ) {
	cout<<"How many member you will creat in the list"<<endl;
	int m;
	int i;
	Type  n;
	cin>>m;
	for(i=0;i<m;i++)
	{
		cout<<"the "<<i+1<<"th member is:"<<endl;
		cin>>n;
        Insert(n,i) ;
	}
	cout<<"OK"<<endl;
}

template <class Type> void List<Type>::Output( ) {
    ListNode<Type> *p ;
	p=first->link;
	if(p==NULL){cout<<"list empty!"<<endl;cout<<last->data;}
	else{
		cout<<"the memeber in the list"<<endl;
		while(p){
			cout<<p->data<<endl;
			p=p->link;
		}
	}
}
