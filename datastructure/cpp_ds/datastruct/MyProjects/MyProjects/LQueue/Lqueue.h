#include<assert.h>
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