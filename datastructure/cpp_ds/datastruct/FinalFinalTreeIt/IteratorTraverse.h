///////////////////////////////////2009.3.8 11////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////栈的声明及实现///////////////////////////////////
template <class Type> class Stack;
template <class Type> class StackNode {
friend class Stack<Type>;
private: 
    Type data;	                         //结点数据	
    StackNode<Type> *link;	       //结点链指针
public:
    StackNode ( Type d = 0, StackNode<Type> *l = NULL ) : data ( d ), link ( l ) { }
};
template <class Type> class Stack {
private:
    StackNode<Type> *top;       //栈顶指针
public:
    Stack ( ) : top ( NULL ) { }
    ~Stack ( );
    void Push ( const Type & item);
    Type Pop ( );
    Type GetTop ( );
    void MakeEmpty ( );         //实现与~Stack( )同
    int IsEmpty ( ) const { return top == NULL; }
	void Output();
};
template <class Type> Stack<Type>::~Stack ( ) {
     StackNode<Type> *p;
     while ( top != NULL )      //逐结点回收
 	 { p = top;  top = top->link;  delete p; }
}
template <class Type> void Stack<Type>::MakeEmpty( ) {
     StackNode<Type> *p;
     while ( top != NULL )      //逐结点回收
 	 { p = top;  top = top->link;  delete p; }
}
template <class Type> void Stack<Type>::Push ( const Type &item ) {
    top = new StackNode<Type> ( item, top );
    //新结点链入top之前, 并成为新栈顶
}
template <class Type> Type Stack<Type>::Pop ( ) {//删除栈顶结点，并返回其值
    assert(!IsEmpty());			
    StackNode<Type> *p = top;
    Type retvalue = p->data;     //暂存栈顶数据
    top = top->link;       //修改栈顶指针
    delete p;   return retvalue;   //释放,返回数据
}

template <class Type> Type Stack<Type>::GetTop ( ) {
    assert(!IsEmpty());
    return top->data;
}
template <class Type> void  Stack<Type>::Output( ) {			  
               StackNode<Type> *p;
			   p=top;
			   if(top==0)
				   cout<<"Empty"<<endl;
			   else{
			   cout<<"the members in the stack"<<endl; 
			   while(top)
				  {
				     
			         cout<<GetTop()<<endl;
			         top=top->link;
				   }
			   }
			   top=p;
}
//////////////////////////////////////////////////////////////////////////////
//////////////////////////队列的声明及实现///////////////////////////////////
template <class Type> class Queue;
template <class Type> class QueueNode {
friend class Queue<Type>;
private: 
    Type data;			     //队列结点数据
    QueueNode<Type> *link;    //结点链指针
public:
    QueueNode ( Type d=0, QueueNode *l=NULL ) : data (d), link (l) { }
};
template <class Type> class Queue {	
private: 
    QueueNode<Type> *front, *rear; //队列指针
public: 
    Queue ( ) : rear ( NULL ), front ( NULL ) { }
    ~Queue ( );						
    void EnQueue ( const Type & item );//将item加入队列中
    Type DeQueue ( );//删除并返回队头元素
    Type GetFront ( );//查看队头元素				
    void MakeEmpty ( ); //置空队列,实现与~Queue( )同
	void Output();
    int IsEmpty ( ) const { return front == NULL; }//判空
};
template <class Type>
Queue<Type>::~Queue ( ) {
//队列的析构函数
    QueueNode<Type> *p;
    while ( front != NULL ) {	     //逐个结点释放
        p = front;  front = front->link;  delete p;
    }
}
template <class Type> void Queue<Type>:: EnQueue ( const Type & item ) {
//将新元素item插入到队列的队尾 
    if ( front == NULL )    //空, 创建第一个结点
	front = rear = new QueueNode<Type> ( item, NULL );
    else                               //队列不空, 插入
         rear = rear->link = new QueueNode<Type> ( item, NULL );
}
template <class Type> Type Queue<Type>::DeQueue ( ) {
//删去队头结点，并返回队头元素的值
    assert(!IsEmpty());	//队列不空时继续执行
    QueueNode<Type> *p = front;
    Type retvalue=p->data;//取出队头结点的值
    front = front->link; 	      //新队头
    delete p;//释放原队头结点
    return  retvalue;//返回原队头结点的值
}
template <class Type> Type Queue<Type>::GetFront() {
//若队不空，则函数返回队头元素的值; 
    assert(!IsEmpty()) ;			
    return front->data;				
}
template <class Type> void Queue<Type>::Output() {
	           QueueNode<Type>  *p;
			   p=front;
			   if(front==NULL)
				   cout<<"Empty!"<<endl;
			   else{
				   cout<<"the member in the queue"<<endl;
			     while(front!=NULL)
				  {
				     //cout<<"member"<<endl; 
			         cout<<GetFront()<<endl;
			         front=front->link;
				   }
			   }
			   front=p;
}
//////////////////////////////////////////////////////////////////////////////
//////////////////////////树的声明及实现///////////////////////////////////
template <class Type> class BinaryTree;
template <class Type> class BinTreeNode {
friend class BinaryTree<Type>;
public:
    BinTreeNode ( ) : leftChild (NULL),rightChild (NULL) { }
    BinTreeNode ( Type item, BinTreeNode<Type> *left = NULL,BinTreeNode<Type> *right = NULL ) :data 

(item),leftChild (left), rightChild(right) { }
    Type GetData ( ) const { return data; } //取得结点的数据
    BinTreeNode<Type> *GetLeft ( ) const{ return leftChild; } //取得结点左子女指针值    
	BinTreeNode<Type> *GetRight( ) const{ return rightChild; } //取得结点右子女指针值
    void SetData ( const Type & item ){ data = item; }//修改结点数据值
    void SetLeft ( BinTreeNode <Type> *L ){ leftChild = L; }	//修改结点左子女指针值
    void SetRight ( BinTreeNode <Type> *R ){ rightChild = R; } //修改结点右子女指针值
private:
    BinTreeNode<Type> *leftChild, *rightChild;   //左、右子女   
    Type data;   //数据域
};

template <class Type> class BinaryTree {
public:
    BinaryTree ( ) : root (NULL) { }//构造函数
    BinaryTree ( Type value ) : RefValue (value), root (NULL) { }
	BinaryTree(const BinaryTree<Type> &s){ root=Copy(s.root);}
    ~BinaryTree ( ) { destroy ( root ); }//析构函数
    int IsEmpty ( ) { return root == NULL ? 1 : 0; }//判空
    BinTreeNode <Type> *Copy(BinTreeNode <Type>  *orignode);
    BinTreeNode <Type> *Parent (BinTreeNode <Type> *current ) 
	{ return root == NULL || root == current?NULL : Parent ( root, current ); }//返回双亲结点地址
    BinTreeNode <Type> *LeftChild (BinTreeNode <Type> *current ) //返回左子女结点地址
        { return root != NULL ? current->leftChild : NULL; }
    BinTreeNode <Type> *RightChild (BinTreeNode <Type> *current ) //返回右子女结点地址
        { return root != NULL ? current->rightChild : NULL; }
    void Insert ( const Type & item){Insert(item,root);}//插入新元素
	void input();
    int Find ( const Type &item ) const;//搜索元素
    const BinTreeNode <Type> *GetRoot ( ) const{ return root; }//取根
    friend istream &operator >> ( istream&in, BinaryTree<Type> &Tree ) ;
    friend ostream &operator << ( ostream&out, BinaryTree <Type> &Tree );
private:
    BinTreeNode <Type> *root;//二叉树的根指针
    Type RefValue;//数据输入停止标志，仅用于输入
    BinTreeNode <Type> *Parent ( BinTreeNode <Type> *start,BinTreeNode <Type> *current );
    void Insert ( const Type &item,BinTreeNode<Type> * &current); 
    void Traverse ( BinTreeNode<Type> *current,ostream &out ) const;
    int Find ( BinTreeNode<Type> *current, const Type &item ) const ;
    void destroy(BinTreeNode<Type> *current);
};
template<class Type> BinTreeNode <Type> * BinaryTree<Type>::Copy(BinTreeNode <Type>  *orignode){
	if(orignode==NULL) return NULL;
	BinTreeNode<Type> *temp=new BinTreeNode<Type>;
	temp->data=orignode->data;
	temp->leftChild=Copy(orignode->leftChild);
	temp->rightChild=Copy(orignode->rightChild);
	return temp;
}
template<class Type> void BinaryTree<Type>:: destroy ( BinTreeNode<Type> *current ) {
    if ( current != NULL ) {
       destroy ( current->leftChild );
       destroy ( current->rightChild );
       delete current;
    }
}
template <class Type> BinTreeNode <Type> * BinaryTree <Type> :: Parent ( BinTreeNode<Type> * start, BinTreeNode 

<Type> *current ) {
     if ( start == NULL ) return NULL;
     if ( start->leftChild == current ||start->rightChild == current )		//找到
		 return start;	
     BinTreeNode <Type> *p;	//否则
     if ( ( p = Parent ( start->leftChild, current ) )
            != NULL ) return p;	//在左子树中搜索
     else return Parent ( start->rightChild, current );//在右子树中搜索
}
template <class Type> void BinaryTree<Type> :: Traverse ( 
BinTreeNode <Type> *current, ostream &out ) 
const {
    if ( current != NULL ) {					       
        out << current->data << ' ';//输出current的数据
        Traverse ( current->leftChild, out );//搜索并输出其左子树
        Traverse ( current->rightChild, out ); //搜索并输出其右子树
    }
}
template <class Type> istream & operator >>( istream & in, BinaryTree <Type> &Tree ) {
     Type item;
     cout << "Construct a binary tree: \n ";			    
     cout << "Input data (end with" << Tree.RefValue 
             << " ): ";
     in >> item;		//输入				
     while ( item != Tree.RefValue ) {			
		Tree.Insert ( item );
         	cout << "输入数据 ( 用 " << Tree.RefValue  << "结束 ):"; 
            in >> item;
    }
    return in;
}
template <class Type> ostream & operator <<
 ( ostream & out, BinaryTree<Type> &Tree ) {
     out << "二叉树的前序遍历.\n";
     Tree.Traverse ( Tree.root, out );
     out << endl;
     return out;
}



template <class Type> void BinaryTree<Type>::Insert ( const Type &item,BinTreeNode<Type> * &current)
{	
	if(current==NULL)
	{
		current=new BinTreeNode<Type>(item);
		if(current==NULL)
		{
			cout<<"out of space!"<<endl;
			exit(1);
		}
	}
	else if(item<current->data) Insert(item,current->leftChild);
	else if(item>current->data) Insert(item,current->rightChild);
}


template <class Type> void BinaryTree<Type>::input()
{
	cout<<"establish a tree:"<<endl;
	cout<<"input the flag for quiting！"<<endl;
	cout<<"RefValue=";
	cin>>RefValue;
	Type item;
	cout<<"please input the node：";
	cin>>item;
	while(item!=RefValue)
		{
		   Insert(item,root);
		   cout<<"please input the node：";
		   cin>>item;
		}
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////树的游标类声明///////////////////////////////////

template <class Type> class TreeIterator {
	public:
		TreeIterator(){
			T=NULL,current=NULL;
		}
		TreeIterator(BinaryTree<Type> BT):T(BT){
		//	cout<<BT.GetRoot();		
		}
		void Traverse()  ;
		~TreeIterator(){}
	protected:
		BinaryTree<Type> T;
		const BinTreeNode<Type> *current;
	private:
		TreeIterator(const TreeIterator&){}
		TreeIterator &operator=(const TreeIterator &)const;
};

template <class Type> struct StkNode{
	const BinTreeNode<Type>  *Node;
	int PopTim;
	StkNode( const BinTreeNode<Type> *N=NULL):Node(N),PopTim(0){}
};
//////////////////////////////////////////////////////////////////////////////
//////////////////////////树的后序遍历声明及实现///////////////////////////////////
template <class Type> class PostOrder:public TreeIterator<Type>{
	public:
		PostOrder(const BinaryTree<Type> &BT);
		~PostOrder(){}
		void First();
		void Traverse();
	protected:
		Stack<StkNode<Type> >  st;
};

template <class Type> PostOrder<Type>::PostOrder(const BinaryTree<Type> &BT):
   TreeIterator<Type>(BT)
   {
	   BinTreeNode<Type> const *temp=T.GetRoot();
	   if(temp!=NULL){
	   StkNode<Type> yy(temp);
	   st.Push(yy);
	   }
   }


template <class Type> void PostOrder<Type>::First(){
	st.MakeEmpty();
	if(T.GetRoot!=NULL)
	{
		BinTreeNode<Type> const *temp=T.GetRoot();
		if(temp!=NULL){
		StkNode<Type> yy(temp);
		st.Push(yy);
		}
	}
}
template<class Type>void PostOrder<Type>::Traverse()   
 {   
      if(st.IsEmpty())   
      {   
         // if(current==NULL){
		  cout<<"This is an empty tree"<<endl;
		 // exit(1);
		  //}   
          //current=NULL;   
          //return;   
      }  
	  else{
		  StkNode<Type>  Cnode(NULL);   
		  cout<<"This is  the output of PostOrder:"<<endl;
		  while(!st.IsEmpty ()) 
		  {   
			  Cnode=st.Pop();
			  if(++Cnode.PopTim==3){
				  current=Cnode.Node;   
				  cout<<current->GetData()<<endl;		 
				  continue;
			  }   
			  st.Push(Cnode);   
			  if(Cnode.PopTim==1)   
			  {   
				  if(Cnode.Node->GetLeft()!=NULL)   
					  st.Push(StkNode<Type>(Cnode.Node->GetLeft()));   
			  }   
			  else   
			  {   
				  if(Cnode.Node->GetRight()!=NULL)   
					  st.Push(StkNode<Type>(Cnode.Node->GetRight()));   
			  }   
		  }   
  }  
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////树的中序遍历声明及实现///////////////////////////////////
template <class Type> class InOrder : public PostOrder <Type> { 
public: 
    InOrder ( BinaryTree <Type> & BT ):PostOrder <Type> ( BT ) { } 
	~InOrder(){}
    void First ( ); 
    void Traverse();
}; 
template <class Type> void InOrder <Type>::Traverse() { 
    if ( st.IsEmpty ( ) ) {				
		//if ( current == NULL ) 
		//{ 
			cout << "This is an empty tree" << endl; // exit (1); 
	//	} 
		//current = NULL;  return; 
	} 
	else{
		StkNode <Type> Cnode(NULL); 
		cout<<"This is  the output of InOrder:"<<endl;
		while(!st.IsEmpty ()) {     //循环,找中序下的下一个结点 
			Cnode = st.Pop();                   //退栈 
			if ( ++Cnode.PopTim == 2 ) { 
				//从左子树退出，成为当前结点 
				current = Cnode.Node; 
				cout<<current->GetData()<<endl;
				if ( Cnode.Node->GetRight ( ) != NULL ) 
				st.Push ( StkNode <Type> (Cnode.Node->GetRight()));    
				continue;
			} 
			st.Push ( Cnode );                  //否则加一进栈                     
			if ( Cnode.Node->GetLeft ( ) != NULL ) 
				st.Push ( StkNode <Type> (Cnode.Node->GetLeft ())); //左子女进栈 		  
		} 
	}
} 


//////////////////////////////////////////////////////////////////////////////
//////////////////////////树的前序遍历声明及实现///////////////////////////////////
template <class Type> class PreOrder:public PostOrder <Type> { 
	public:
		PreOrder(BinaryTree<Type> &BT):PostOrder <Type> (BT) {}   
		~PreOrder(){}
		void First();
		void Traverse();
};

template <class Type> void PreOrder <Type>::Traverse() { 
	if (st.IsEmpty()){ 
		//if(current==NULL){
			cout<<"This is an empty tree"<<endl; 
			//exit(1);
	//	}
	//	current=NULL;
	
	}
	else{
		StkNode <Type> Cnode(NULL); 
		cout<<"This is  the output of PreOrder:"<<endl;
		do{ 

			Cnode = st.Pop(); 
			current=Cnode.Node;
			cout<<current->GetData()<<endl;
			if( current->GetRight()!=NULL) st.Push(current->GetRight());
			if( current->GetLeft()!=NULL) st.Push(current->GetLeft());
		} while(!st.IsEmpty ());
	}
	
} 

//////////////////////////////////////////////////////////////////////////////
//////////////////////////树的层次遍历声明及实现///////////////////////////////////
template <class Type> class LevelOrder : public TreeIterator <Type> { 
public: 
    LevelOrder ( const BinaryTree <Type> & BT ); 
    ~LevelOrder() {} 
    void First(); 
    void Traverse(); 
protected: 
    Queue < const BinTreeNode <Type> * > qu; 
};

template <class Type> LevelOrder<Type>::LevelOrder(const BinaryTree<Type> &BT):TreeIterator<Type>(BT)
   {
	   BinTreeNode<Type> const *temp=T.GetRoot();
	   if(temp!=NULL)
	   qu.EnQueue (temp);

	   //StkNode<Type> yy(temp);
	   //st.Push(yy);
   }
template <class Type> void LevelOrder<Type> ::Traverse( ) { 
	 if ( qu.IsEmpty ( ) ) { 
		 cout << "This is an empty tree!" << endl;  ;
	 } 
	 else{
		 cout<<"This is  the output of LevelOrder:"<<endl;
		 while(!qu.IsEmpty ( )){
			 //current=Cnode.Node;
			 current = qu.DeQueue ( );  //退队    
			 cout<<current->GetData()<<endl;
			 if ( current->GetLeft ( ) != NULL )          //左子女 
				 qu.EnQueue ( current->GetLeft ( ) );   //进队列 
			 if ( current->GetRight ( ) != NULL )        //右子女 
				 qu.EnQueue ( current->GetRight ( ) ); //进队列 
		 }
	 }
} 
