class List;//类的前视定义	
class ListNode {   //链表结点类的定义
friend class List;//List类作友类定义
    int data;                        //结点数据域 
    ListNode *link;    //结点链接指针域
public:
    ListNode ( );               //链表结点构造函数（不含数据）
    ListNode ( const int& item );//给数据的构造函数
    ListNode *NextNode ( ) { return link; }
    //给出当前结点的下一结点（即直接后继）的地址
    ListNode *GetNode ( const int& item, ListNode *next ); //创建数据为item，指针为next的新结点
	void InsertAfter ( ListNode *p );
      //在当前结点后插入p所指的结点
     ListNode *RemoveAfter ( );
     //在链中摘下当前结点的下一结点
};
class List {
    ListNode *first, *last;//表头、表尾指针		
public:
	List ( ) :first(NULL),last(NULL){}
    List ( const int & value ) 
   { 
        last =first = new ListNode( value );
    }    	                                  //构造函数
    ~List ( );		            //析构函数
    void MakeEmpty ( );        //链表置空
    int Length ( ) const;        //求链表长度
    ListNode *Find ( int i ); //搜索第i个元素的地址
	void Createlist( ) ;
    int Insert ( int value, int i ); //将新元素value插到第i个位置
	void Output();
	void Combine(List &hb);
	void Inverse( );
	ListNode * ReturnFirst(){return first->link;}
	ListNode * Return(){return first;};
	ListNode * Return3(){return first->link->link;};
	int Max();
	ListNode *Min_address();
    //Type *Remove ( int i ); //将第i个元素删除
	void Remove(int value);
    int *Get ( int i ); //取出第i个元素
	void sort(List &list);
	void sort_first();
};
ListNode :: ListNode ( ) : link (NULL) { }//仅初始化指针成员
ListNode::ListNode( const int& item ) :data (item), link (NULL) { } //初始化数据与指针成员

void ListNode::InsertAfter ( ListNode *p )
{ p->link = link;  link = p; }//将P指针指向结点插入到当前结点后

ListNode *ListNode::GetNode ( const int & item,  ListNode *next = NULL )  {
//以给定的参数建立新结点，返回新结点指针
     ListNode *newnode =new ListNode ( item );
      newnode ->link = next;	
      return newnode;
}

ListNode *ListNode::RemoveAfter ( ) {
//摘下当前结点的下一结点
ListNode *tempptr = link;	
     if ( link == NULL ) return NULL;
     //没有下一结点则返回空指针
     link = tempptr->link;	   //重新链接		
     return tempptr;            
     //返回下一结点地址
}

List :: ~List ( ){
//析构函数 (链表的公共操作)
     MakeEmpty ( );  delete first;
     //链表置空，再删去表头结点
}
void List:: MakeEmpty ( ) {
//删去链表中除表头结点外的所有其他结点
    ListNode *q;
    while ( first->link != NULL ) {
         q = first->link;  first->link = q->link;
         //将表头结点后第一个结点从链中摘下
         delete q;        //释放它 
    }
    last = first;         //修改表尾指针
}
int List::Length ( ) const {
//求单链表的长度
     ListNode *p = first->link;
     //检测指针p指示第一个结点
     int count = 0; 
     while ( p != NULL ) {      //逐个结点检测
          p = p->link;  count++;
     }			
     return count;
}
ListNode *List:: Find ( int i ) {
//在链表中从头搜索第 i 个结点，不计头结点
     if ( i < -1 ) return NULL;			
     if ( i == -1 ) return first;	         // i 应 ? 0
     ListNode *p = first->link;  
     int j = 0;		
     while ( p != NULL && j < i )          // j = i 停
 	  { p = p->link; j++; }	
     return p;				
}
int List:: Insert ( int value, int i ) {
//将含value的新元素插入到链表第 i 个位置
    ListNode  *p = Find ( i-1 );
    // p 指向链表第 i-1个结点
    if ( p == NULL ) return 0;
    ListNode *newnode =p->GetNode ( value, p->link );//创建结点
    if ( p->link == NULL ) last = newnode;
    p->link = newnode;                    //重新链接
    return 1;
}
void List::Remove(int value){
	ListNode *p=first->link,*q=first;
	if(p==NULL) return ;
	else{
		while(p->data!=value&&p!=NULL) {q=p;p=p->link;}
		if(p==first->link) {
			if(p->link==NULL){first->link=NULL;}
			else{
				first->link=p->link;
			}
		}
		else{
			if(p->link==NULL){
				q->link=NULL;
			}
			else{
				q->link=p->link;
			}
		}
	}

}
void List::Createlist( ) {
	cout<<"How many member you will creat in the list"<<endl;
	int m;
	int i;
	int  n;
	cin>>m;
	for(i=0;i<m;i++)
	{
		cout<<"the "<<i+1<<"th member is:"<<endl;
		cin>>n;
        Insert(n,i) ;
	}
	cout<<"OK"<<endl;
}

void List::Output( ) {
    ListNode *p ;
	p=first;
	if(first->link==NULL){cout<<"list empty!"<<endl;cout<<last->data;}
	else{
		p=first->link;
		cout<<"the memeber in the list"<<endl;
		while(p){
			cout<<p->data<<endl;
			p=p->link;
		}
	}
}
int List::Max( ) {
	ListNode *temp;
	temp=first->link; 
	int  max=temp->data;
	while(temp){
		if(temp->data>max){max=temp->data;}
		temp=temp->link;
	}
	return max;
}

void List::Combine(List &hb){
	ListNode *temp,*pa,*pb,*at,*bt;
	if(this->Length ( )<hb.Length()){
		temp=first;
		first=hb.first;
		hb.first=temp;
	}
		at=pa=first->link;bt=pb=hb.first->link;
		while(bt!=NULL){
			pa=at->link;
			pb=bt->link;
			at->link=bt;
			bt->link=pa;
			at=pa;
			bt=pb;
		}
}
void List::sort(List &temp) {
	int count=0;
	int Temp;
	int n=Length();
	for(int i=0;i<n;i++){
		temp.Insert (Max(),count);
		Temp=Max();
		Remove(Temp);
	}
}
