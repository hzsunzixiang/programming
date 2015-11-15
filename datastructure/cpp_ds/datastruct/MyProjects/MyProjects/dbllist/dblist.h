template <class Type> class DblList;

template <class Type> class DblNode {
friend class DblList<Type>;
private:
    Type data;                                      //数据
    DblNode<Type> *lLink, *rLink;   //左右链指针
    DblNode ( Type value,DblNode<Type> *left, DblNode<Type> *right ) :
          data (value), lLink (left), rLink (right) { } //构造函数
    DblNode ( Type value ) : data (value),
          lLink (NULL), rLink (NULL),current(NULL){ }	//构造函数
};

template <class Type> class DblList {
public:
    DblList ( Type uniqueVal );//构造函数,建立头结点
    ~DblList ( );//析构函数:释放所用空间
    int Length ( ) const;
    int IsEmpty ( ) { return first->rlink == first; }//判空
    int Find ( const Type & target );//找等于给定值的结点
    Type getData ( ) const;//返回当前结点的值
    void Firster ( ) { current = first; }//当前指针指向头结点
    int First ( ); //当前指针指向头结点
    int Next ( ); //当前指针指向当前结点的直接后继
    int Prior ( ); //当前指针指向当前结点的直接前驱
    int operator ! ( ) //重载操作符:判current是否为空
          { return current != NULL; }	
    void Insert ( const Type & value );	//插入新结点
    void Remove ( );//删除当前结点
private:
    DblNode<Type> *first, *current;
};
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
         current = first->rLink =new DblNode ( value, first, first );
     else {                                      //非空表情形
         current->rLink =new DblNode ( value, current, current->rLink );
	     current = current->rLink;//新结点成为当前结点
     }
     current->rLink->lLink = current;//完成重新链接
}
template <class Type> void DblList<Type>::Remove ( ) {
    if ( current != NULL ) {
        DblNode *temp = current;         //被删结点
        current = current->rLink;	      //下一结点
        current->lLink = temp->lLink;  //从链中摘下
        temp->lLink->rLink = current;
        delete temp; 		               //删去
        if ( current == first )
           if ( IsEmpty ( ) ) current = NULL;
           else  current = current->rLink;
    }
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