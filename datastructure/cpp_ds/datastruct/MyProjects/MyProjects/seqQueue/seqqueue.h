#include <assert.h>
template <class Type> class Queue {	
private:
    int rear, front;
    Type *elements;
    int maxSize;
public: 
     Queue ( int=10 );
     ~Queue ( ) { delete [ ] elements; }
     int EnQueue ( const Type & item);
     Type DeQueue ( );
     Type GetFront ( );
     void MakeEmpty ( ) { front = rear = 0; }//队头、队尾指针置0
     int IsEmpty ( ) const 
        { return front == rear; }//判空
     int IsFull ( ) const
        { return (rear+1) % maxSize == front; }//判满
     int Length ( ) const
        { return (rear-front+maxSize) % maxSize;}
	 void Output();
	//求队列元素个数
};
template <class Type> Queue<Type>::Queue ( int sz ) : front (0), rear (0), maxSize (sz) {
    elements = new Type[maxSize];		
    assert ( elements != 0 );
}//建立一个最大具有maxSize个元素的空队列
template <class Type> int Queue<Type>::EnQueue ( const Type & item ) {
     //assert ( !IsFull ( ) );					  
   if( IsFull ( ) )
		return 0;
    else{
		rear = (rear+1) % maxSize;			
        elements[rear] = item;	  //加入新元素
	    return 1;
	}
}//若队列不满，将item插入到队尾，否则出错处理
template <class Type>
Type Queue<Type>::DeQueue ( ) {
     assert ( !IsEmpty ( ) );				
     front = ( front+1) % maxSize;			
     return elements[front];
}//若队列不空，返回队头元素的值，同时删除该元素
template <class Type> Type Queue<Type>::GetFront ( ) {
     assert ( !IsEmpty ( ) );				
     return elements[( front+1) % maxSize];
}//若队列不空，返回队头元素的值
template <class Type> void Queue<Type>::Output ( ) {
			  int temp;
			   temp=front;
			   if(front%maxSize==rear)
				   cout<<"Empty!"<<endl;
			   else{
				   cout<<"the member in the queue"<<endl;
			     while(front%maxSize!=rear)
				  {
				     //cout<<"member"<<endl;
			         cout<<GetFront()<<endl;
			         front++;
				   }
			   front=temp;
}
}